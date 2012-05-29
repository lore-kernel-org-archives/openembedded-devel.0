Received: from plane.gmane.org ([80.91.229.3])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <gcho-openembedded-devel@m.gmane.org>)
	id 1SZKA3-0007Zv-0P for openembedded-devel@lists.openembedded.org;
	Tue, 29 May 2012 13:00:23 +0200
Received: from list by plane.gmane.org with local (Exim 4.69)
	(envelope-from <gcho-openembedded-devel@m.gmane.org>)
	id 1SZK04-0001z8-MD for openembedded-devel@lists.openembedded.org;
	Tue, 29 May 2012 12:50:04 +0200
Received: from cpc19-cmbg14-2-0-cust6.5-4.cable.virginmedia.com ([86.6.30.7])
	by main.gmane.org with esmtp (Gmexim 0.1 (Debian))
	id 1AlnuQ-0007hv-00 for <openembedded-devel@lists.openembedded.org>;
	Tue, 29 May 2012 12:50:04 +0200
Received: from chris by cpc19-cmbg14-2-0-cust6.5-4.cable.virginmedia.com with
	local (Gmexim 0.1 (Debian)) id 1AlnuQ-0007hv-00
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 29 May 2012 12:50:04 +0200
X-Injected-Via-Gmane: http://gmane.org/
To: openembedded-devel@lists.openembedded.org
From: Chris Diamand <chris@diamand.org>
Date: Tue, 29 May 2012 10:40:03 +0000 (UTC)
Message-ID: <loom.20120529T123552-567@post.gmane.org>
References: <CAG2TeNrp6cR1UmrPU0+UKHerR113q2_O_56HHZoBOfnGRrccTw@mail.gmail.com>
Mime-Version: 1.0
X-Complaints-To: usenet@dough.gmane.org
X-Gmane-NNTP-Posting-Host: sea.gmane.org
User-Agent: Loom/3.14 (http://gmane.org/)
X-Loom-IP: 86.6.30.7 (Mozilla/5.0 (X11;
	Linux x86_64) AppleWebKit/535.19 (KHTML, like Gecko)
	Chrome/18.0.1025.151 Safari/535.19)
Subject: Re: Compile error in openssl 1.0.0e
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
X-List-Received-Date: Tue, 29 May 2012 11:00:23 -0000
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit

>    if ( data->connected )
>        ret=writesocket(b->num,in,inl);
>    else
>        {
>        int peerlen = sizeof(data->peer);
> 
>        if (data->peer.sa.sa_family == AF_INET)
>            peerlen = sizeof(data->peer.sa_in);
> #if OPENSSL_USE_IPV6                               /**** HERE ****/
>    case BIO_C_FILE_TELL:
>    case BIO_CTRL_INFO:
>        ret=0;
>        break;
>    case BIO_C_SET_FD:
>        dgram_clear(b);
>        b->num= *((int *)ptr);
>        b->shutdown=(int)num;
>        b->init=1;
>        break;
>    case BIO_C_GET_FD:
>        if (b->init)
>            {
>            ip=(int *)ptr;
>            if (ip != NULL) *ip=b->num;
>            ret=b->num;
>            }
>        else
>            ret= -1;
>        break;
>    case BIO_CTRL_GET_CLOSE:
>        ret=b->shutdown;
>        break;
>    case BIO_CTRL_SET_CLOSE:
>        b->shutdown=(int)num;
>        break;
>    case BIO_CTRL_PENDING:
> ...
> 
> If OPENSSL_USE_IPV6 is defined it puts a random case label (sans
> switch() ) in the middle of the function. This is clearly not going to
> work.
> 
> This has been fixed in the latest version, 1.0.1c, which compiles
> without errors.
> 
> Could the openssl recipe be updated to the latest version which actually 
builds?
> 
> Cheers,
> Chris.
> 

Just looked again. The openssl source actually appears to be fine - it's this 
sed line in 
recipes/openssl/openssl.inc:

diff --git a/recipes/openssl/openssl.inc b/recipes/openssl/openssl.inc
index 2aff24a..d087a8b 100644
--- a/recipes/openssl/openssl.inc
+++ b/recipes/openssl/openssl.inc
@@ -106,7 +106,8 @@ do_configure () {
        perl ./Configure ${EXTRA_OECONF} shared --prefix=$useprefix --
openssldir=${libdir}/ssl $target
 
        eval "${@base_contains('DISTRO_FEATURES', 'largefile', '', 'sed -i -e 
"/_FILE_OFFSET_BITS/,/#endif/d" ${S}/crypto/bio/bss_file.c', d)}"
-       eval "${@base_contains('DISTRO_FEATURES', 'ipv6', '', 'sed -i -e 
"/AF_INET6/,/break/d" ${S}/crypto/bio/bss_dgram.c', d)}"
+
+       # eval "${@base_contains('DISTRO_FEATURES', 'ipv6', '', 'sed -i -e 
"/AF_INET6/,/break/d" ${S}/crypto/bio/bss_dgram.c', d)}"
 }
 
 do_compile () {


Cheers.




