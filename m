Received: from mail2.eads.net ([80.156.45.114] helo=mail.eads.net)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <Wolfgang.Hauser.external@cassidian.com>)
	id 1QAgSL-0007zG-69 for openembedded-devel@lists.openembedded.org;
	Fri, 15 Apr 2011 12:40:53 +0200
Received: from gsx3072-vs5.mxchg.m.corp ([53.147.176.149])
	by mail.eads.net (8.13.8/8.13.8/Debian-2) with ESMTP id p3FAcd7j023367
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 15 Apr 2011 12:38:40 +0200
Received: from gsx300a.mxchg.m.corp ([10.43.212.131]) by
	gsx3072-vs5.mxchg.m.corp with Microsoft SMTPSVC(6.0.3790.4675); 
	Fri, 15 Apr 2011 12:38:33 +0200
X-MimeOLE: Produced By Microsoft Exchange V6.5
MIME-Version: 1.0
Date: Fri, 15 Apr 2011 12:37:28 +0200
Message-ID: <0C757E680E33864AB113392C7E83F910BE5160@GSX300A.mxchg.m.corp>
In-Reply-To: <0C757E680E33864AB113392C7E83F910BE5D80@GSX300A.mxchg.m.corp>
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
Thread-Topic: Bug in IPV6 DISTRO_FEATURE handling in recipe
	openssl_1.0.0d.bb/openssl.inc
Thread-Index: Acv7UzUOPnhESm9BTqyKbXnnjQwqfAABbbwg
References: <0C757E680E33864AB113392C7E83F910BE5D80@GSX300A.mxchg.m.corp>
From: "Hauser, Wolfgang (external)" <Wolfgang.Hauser.external@cassidian.com>
To: <openembedded-devel@lists.openembedded.org>
X-OriginalArrivalTime: 15 Apr 2011 10:38:33.0005 (UTC)
	FILETIME=[447F5DD0:01CBFB59]
Subject: Re: Bug in IPV6 DISTRO_FEATURE handling in recipe openssl_1.0.0d.bb/openssl.inc
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: openembedded-devel@lists.openembedded.org
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-devel>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Fri, 15 Apr 2011 10:40:53 -0000
Content-class: urn:content-classes:message
Content-Type: text/plain;
	charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable

Tested a bit, the sed command should look like:

   eval "${@base_contains('DISTRO_FEATURES', 'ipv6', '', 'sed -i -e =
\'/case AF_INET6:/,/break/d\' ${S}/crypto/bio/bss_dgram.c', d)}"=20

Regards
Wolfgang

-----Urspr=FCngliche Nachricht-----
Von: Hauser, Wolfgang (external)=20
Gesendet: Freitag, 15. April 2011 11:55
An: openembedded-devel@lists.openembedded.org
Betreff: Bug in IPV6 DISTRO_FEATURE handling in recipe =
openssl_1.0.0d.bb/openssl.inc

I don't use IPV6, so I removed this feature from my DISTRO_FEATURES. =
This results in a mangled code in crypto/bio/bss_dgram.c.

The sed command in openssl.inc:

	eval "${@base_contains('DISTRO_FEATURES', 'ipv6', '', 'sed -i -e =
"/AF_INET6/,/break/d" ${S}/crypto/bio/bss_dgram.c', d)}"

cuts out following needed code:

bss_dgram.c
>>>>>>
line 344
		else if (data->peer.sa.sa_family =3D=3D AF_INET6)
			peerlen =3D sizeof(data->peer.sa_in6);
#endif
#if defined(NETWARE_CLIB) && defined(NETWARE_BSDSOCK)
		ret=3Dsendto(b->num, (char *)in, inl, 0, &data->peer.sa, peerlen);
#else
		ret=3Dsendto(b->num, in, inl, 0, &data->peer.sa, peerlen);
#endif
		}

	BIO_clear_retry_flags(b);
	if (ret <=3D 0)
		{
		if (BIO_dgram_should_retry(ret))
			{
			BIO_set_retry_write(b); =20
			data->_errno =3D get_last_socket_error();

#if 0 /* higher layers are responsible for querying MTU, if necessary */
			if ( data->_errno =3D=3D EMSGSIZE)
				/* retrieve the new MTU */
				BIO_ctrl(b, BIO_CTRL_DGRAM_QUERY_MTU, 0, NULL);
#endif
			}
		}
	return(ret);
	}

static long dgram_ctrl(BIO *b, int cmd, long num, void *ptr)
	{
	long ret=3D1;
	int *ip;
	struct sockaddr *to =3D NULL;
	bio_dgram_data *data =3D NULL;
#if defined(IP_MTU_DISCOVER) || defined(IP_MTU)
	long sockopt_val =3D 0;
	unsigned int sockopt_len =3D 0;
#endif
#ifdef OPENSSL_SYS_LINUX
	socklen_t addr_len;
	union	{
		struct sockaddr	sa;
		struct sockaddr_in s4;
#if OPENSSL_USE_IPV6
		struct sockaddr_in6 s6;
#endif
		} addr;
#endif

	data =3D (bio_dgram_data *)b->ptr;

	switch (cmd)
		{
	case BIO_CTRL_RESET:
		num=3D0;
	case BIO_C_FILE_SEEK:
		ret=3D0;
		break;
<<<<

do it with sed is strange, but it may be better to use:

   eval "${@base_contains('DISTRO_FEATURES', 'ipv6', '', 'sed -i -e =
"/case AF_INET6:/,/break/d" ${S}/crypto/bio/bss_dgram.c', d)}"

May be doing it witch a patch or disable OPENSSL_USE_IPV6 in configure =
is the saver solution.

I use the tar ball of 2011.03 release, so I am not able to create a =
proper patch from git.

Regards Wolfgang


