Received: from mail-fx0-f210.google.com ([209.85.220.210])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <aalonso00@gmail.com>) id 1NhpaT-0007Pw-41
	for openembedded-devel@lists.openembedded.org;
	Wed, 17 Feb 2010 20:29:33 +0100
Received: by fxm2 with SMTP id 2so1613200fxm.27
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 17 Feb 2010 11:26:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:received:in-reply-to:references
	:date:message-id:subject:from:to:content-type;
	bh=HI80An7ZB2zljJQmRJMJN86fsD5Xli+5nKv44bfwqBU=;
	b=B+7rdZlSeYDDpRflEe7X/3ftsSGFxdAb4vLmLG6Q/eugoaUckgI8Qf7ahn/Hz35auZ
	kC73BmfaMINAJZOJUiGtcRSu9Jm+3ZvP77zzJCg5lxiQ7W9QNeCe6jJtIBhSefoLMBbP
	Kz+67ERkei9Olxyzhkrdy1uhCbb/uw0fHhQ7Q=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type;
	b=adu59Z0dg8SaSh3iTBBq1fu2BHGagdzRW2W3ugmsCRn/JqXtyNqNONrViDqpvAvm8R
	hTqEBTlfYpg3HC9oNDzDukZFHYKabsifD3d4r+n2lWxjrF9sYlptjMT4sg0vyyXa2XUj
	Vq3dnKxX6z4qw1tSfraGpNSlT+e6J/e3w/PBM=
MIME-Version: 1.0
Received: by 10.223.73.82 with SMTP id p18mr10320546faj.34.1266434809379; Wed, 
	17 Feb 2010 11:26:49 -0800 (PST)
In-Reply-To: <20100217183403.GA18358@excalibur.local>
References: <1266337930-2440-1-git-send-email-aalonso00@gmail.com>
	<20100217183403.GA18358@excalibur.local>
Date: Wed, 17 Feb 2010 13:26:49 -0600
Message-ID: <d1ded4381002171126l3f4866f7sc45cc7a94ae43bd0@mail.gmail.com>
From: Adrian Alonso <aalonso00@gmail.com>
To: openembedded-devel@lists.openembedded.org
X-SA-Exim-Connect-IP: 209.85.220.210
X-SA-Exim-Mail-From: aalonso00@gmail.com
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: No (on linuxtogo.org); Unknown failure
X-Content-Filtered-By: Mailman/MimeDel 2.1.11
Subject: Re: [PATCH 1/4] tune-ppc440.inc: add ppc440 to PACKAGE_EXTRA_ARCHS
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
X-List-Received-Date: Wed, 17 Feb 2010 19:29:33 -0000
X-Groupsio-MsgNum: 16875
Content-Type: multipart/mixed; boundary=0015174c0f3ef1be1e047fd0d4c4

--0015174c0f3ef1be1e047fd0d4c4
Content-Type: text/plain; charset=ISO-8859-1

Hi,

I just found an error on one recipe xilinx-ml507.conf is in the line where
it defines the u-boot
target machine, running `bitbake console-image` completes without showing
any error, instead
it should warn or return an error since there's no valid configuration
target.

Attached is the proper patch, also I send it to dev mail list.


On Wed, Feb 17, 2010 at 12:34 PM, Stefan Schmidt
<stefan@datenfreihafen.org>wrote:

> Hello.
>
> On Tue, 2010-02-16 at 10:32, Adrian Alonso wrote:
> > Signed-off-by: Adrian Alonso <aalonso00@gmail.com>
>
> Acked-by: Stefan Schmidt <stefan@datenfreihafen.org>
>
> I've compile tested all four patches here and they work fine. Before
> applying
> I would like to get an ACK from one of our PowerPC guys.
>
> regards
> Stefan Schmidt
>
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel
>



-- 
Saludos
Adrian Alonso
http://aalonso.wordpress.com

--0015174c0f3ef1be1e047fd0d4c4
Content-Type: text/x-patch; charset=US-ASCII; 
	name="0001-xilinx-ml507.conf-fix-u-boot-config-file.patch"
Content-Disposition: attachment; 
	filename="0001-xilinx-ml507.conf-fix-u-boot-config-file.patch"
Content-Transfer-Encoding: base64
X-Attachment-Id: f_g5siqoie0

RnJvbSAyYjQ3MDcyNWNkYTAzM2ExYjdlODE0YjU3YjI2MjAxNWI5YjcxZTRjIE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBBZHJpYW4gQWxvbnNvIDxhYWxvbnNvMDBAZ21haWwuY29tPgpE
YXRlOiBUdWUsIDE2IEZlYiAyMDEwIDIyOjM4OjM5IC0wNjAwClN1YmplY3Q6IFtQQVRDSF0geGls
aW54LW1sNTA3LmNvbmY6IGZpeCB1LWJvb3QgY29uZmlnIGZpbGUKClNpZ25lZC1vZmYtYnk6IEFk
cmlhbiBBbG9uc28gPGFhbG9uc28wMEBnbWFpbC5jb20+Ci0tLQogY29uZi9tYWNoaW5lL3hpbGlu
eC1tbDUwNy5jb25mIHwgICAgMiArLQogMSBmaWxlcyBjaGFuZ2VkLCAxIGluc2VydGlvbnMoKyks
IDEgZGVsZXRpb25zKC0pCgpkaWZmIC0tZ2l0IGEvY29uZi9tYWNoaW5lL3hpbGlueC1tbDUwNy5j
b25mIGIvY29uZi9tYWNoaW5lL3hpbGlueC1tbDUwNy5jb25mCmluZGV4IDYxOTQ0NjkuLmIyNDQ4
ZTMgMTAwNjQ0Ci0tLSBhL2NvbmYvbWFjaGluZS94aWxpbngtbWw1MDcuY29uZgorKysgYi9jb25m
L21hY2hpbmUveGlsaW54LW1sNTA3LmNvbmYKQEAgLTE5LDcgKzE5LDcgQEAgTUFDSElORV9GRUFU
VVJFUyA9ICJrZXJuZWwyNiBleHQyIHVzYmhvc3QgdWRldiIKIE1BQ0hJTkVfRVhUUkFfUkVDT01N
RU5EUyA9ICJrZXJuZWwtbW9kdWxlcyIKIAogVUJPT1RfQVJDSCA9ICJwcGMiCi1VQk9PVF9NQUNI
SU5FID0gIm1sNTA3X2RlZmNvbmZpZyIKK1VCT09UX01BQ0hJTkUgPSAibWw1MDdfY29uZmlnIgog
CiAjIFhpbGlueCBFREsgb3ZlcnJpZGUgaGFyZHdhcmUgIGRlZmluaXRpb25zIGZvciB4aWxpbngt
YnNwCiAjIEluY2x1ZGUgaW4geW91ciBsb2NhbC5jb25mCi0tIAoxLjYuNgoK

--0015174c0f3ef1be1e047fd0d4c4--
