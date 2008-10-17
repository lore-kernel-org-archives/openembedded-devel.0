Received: from [195.149.226.213] (helo=smtp.host4.kei.pl)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <openembedded@haerwu.biz>) id 1KquG4-0005gM-Kh
	for openembedded-devel@openembedded.org; Fri, 17 Oct 2008 20:41:08 +0200
Received: (qmail 5329 invoked by uid 813007); 17 Oct 2008 18:41:02 -0000
X-clamdmail: clamdmail 0.18a
Received: from 195.149.226.213 (HELO home.localnet)
	(marcin@haerwu.biz@195.149.226.213)
	by 195.149.226.213 with ESMTPA; 17 Oct 2008 18:41:02 -0000
From: Marcin Juszkiewicz <openembedded@haerwu.biz>
To: openembedded-devel@lists.openembedded.org
Date: Fri, 17 Oct 2008 20:41:09 +0200
User-Agent: KMail/1.10.1 (Linux/2.6.27; KDE/4.1.2; x86_64; ; )
References: <20081017131704.GA4334@jama>
In-Reply-To: <20081017131704.GA4334@jama>
MIME-Version: 1.0
Message-Id: <200810172041.10116.openembedded@haerwu.biz>
Subject: Re: checksums.ini - should check only against filename not uri_src
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
X-List-Received-Date: Fri, 17 Oct 2008 18:41:08 -0000
Content-Type: text/plain;
  charset="iso-8859-2"
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

=46riday 17 of October 2008 15:17:04 Martin Jansa napisa=B3(a):

> I think that there is no reason to have 2 files with same name from 2
> different mirrors with different checksums.=20

If they have different checksums then they are not same.

> Especially when both will end up in one shared download directory
> ${DL_DIR}.

> Attached is patch adding option to have only filename or pn-filename
> or pn-pv-filename in checksums.ini for base.bbclass and also
> shortened checksums.ini (98 were now duplicit after removing their
> url part.

> pn-filename and pn-pv-filename are considered only, because some
> archives have "bad" names like "1.8.3.tar.bz2" and there could be a
> conflict with other archive with same filename. In this case I should
> use checksum name in form pn-filename ie.:
> bitbake-1.8.3.tar.bz2 #looks like another type of possible conflict
> :/ firmware-1.8.3.tar.bz2
> to make sure, that only right file from DL_DIR could be used.

> What do you think?

Your patch lack part which would write simplified checksums.ini file.=20

I think that mirrors informations would be still handy as there were=20
ideas to write wget-like tool for fetching sources which would use own=20
database for informations about source locations. We could make use of=20
format like this:

[DirectFB-1.1.0.tar.gz]
url0=3Dhttp://www.directfb.org/download/DirectFB/DirectFB-1.1.0.tar.gz
url1=3Dhttp://www.directfb.org/downloads/Old/DirectFB-1.1.0.tar.gz
md5=3Dda30fa2748c7501913c8832a83e654ab
sha256=3D0ee87256a278079955d78e4f235c15a174afbb507b5434f1966cd3e5f5a3f23a
=20
And any change to checksums.ini format would require updating=20
contrib/source-checker/ scripts as they are used to check source mirrors=20
integrity and to sort checksums.ini file.

Regards,=20
=2D-=20
JID:      hrw@jabber.org
Website:  http://blog.haerwu.biz/
LinkedIn: http://www.linkedin.com/in/marcinjuszkiewicz




