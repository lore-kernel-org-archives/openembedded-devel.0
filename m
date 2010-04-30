Received: from mail-pw0-f47.google.com ([209.85.160.47])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <ashcharles@gmail.com>) id 1O7u52-00037v-7f
	for openembedded-devel@lists.openembedded.org;
	Fri, 30 Apr 2010 19:33:03 +0200
Received: by pwj5 with SMTP id 5so256643pwj.6
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 30 Apr 2010 10:29:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:received:mime-version:received:from:date
	:message-id:subject:to:content-type;
	bh=i1il3Piv1hQ/dmrN+rPBfRCDb+ZiTeJFBY35dHDr0U4=;
	b=dIbkWbnMPeBn6yOyCFjWHm0Erm8UrNirt2WbYV2/317yzDADC9yDCxr3EfpEfP8FL+
	fKFqqAnN4qa5YYdhwd6zGQru1wRg/4TU1jLBCndgB1TbyFowZhGizuBYz3yn63QEtVz/
	MSBosq+h1iHGyKQJccHHKt84UJYeOzeKzrwqc=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:from:date:message-id:subject:to:content-type;
	b=ksOeZEk9ZEo3h6nHdWBZFuYxm/ZZOlLjQapeKq89YFxjkb4d1FkU80A1GHM8dvPxvN
	b+hbGGdYrpLOJH9+WwX7bA3x1Yk5xpJqAj713cpdvcIE2JlkU49a3LpKxoUQAgdEgEwg
	FdmWxx6TRi5ygWJ9gviTkCm65xlmBZyfWcPyA=
Received: by 10.141.139.11 with SMTP id r11mr1028516rvn.61.1272648540140; Fri, 
	30 Apr 2010 10:29:00 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.140.208.6 with HTTP; Fri, 30 Apr 2010 10:28:40 -0700 (PDT)
From: Ash Charles <ashcharles@gmail.com>
Date: Fri, 30 Apr 2010 10:28:40 -0700
Message-ID: <w2tbd4a003f1004301028p5658d66eyb0083748bfaf498@mail.gmail.com>
To: openembedded-devel@lists.openembedded.org
X-SA-Exim-Connect-IP: 209.85.160.47
X-SA-Exim-Mail-From: ashcharles@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=BAYES_00,SPF_PASS
	autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Adding a nounpack url parameter to base.bbclass
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
X-List-Received-Date: Fri, 30 Apr 2010 17:33:08 -0000
X-Groupsio-MsgNum: 18903
Content-Type: multipart/mixed; boundary=000325561ef628b54f048577942c

--000325561ef628b54f048577942c
Content-Type: text/plain; charset=UTF-8

Hi,

I added a minor change to base.bbclass to accept a 'nounpack=1'
parameter to stop bitbake from unpacking a file that has a bz2, tar...
extension; this is useful if you actually want to include such an
archive file in a package.  I'm not familiar with the policies for
submitting patches however I thought other people might find it useful
so I've included it below:
==================================
diff --git a/classes/base.bbclass b/classes/base.bbclass
index 4d5d73d..387a066 100644
--- a/classes/base.bbclass
+++ b/classes/base.bbclass
@@ -171,21 +171,29 @@ def oe_unpack_file(file, data, url = None):
        else:
                efile = file
        cmd = None
-       if file.endswith('.tar'):
+
+        # allow a 'nounpack=1' url parameter to prevent unpacking of archives
+        unpack = True
+        (type, host, path, user, pswd, parm) = bb.decodeurl(url)
+        if 'nounpack' in parm:
+                if parm['nounpack']:
+                        unpack = False
+
+       if unpack and file.endswith('.tar'):
                cmd = 'tar x --no-same-owner -f %s' % file
-       elif file.endswith('.tgz') or file.endswith('.tar.gz') or
file.endswith('.tar.Z'):
+       elif unpack and (file.endswith('.tgz') or
file.endswith('.tar.gz') or file.endswith('.tar.Z')):
                cmd = 'tar xz --no-same-owner -f %s' % file
-       elif file.endswith('.tbz') or file.endswith('.tbz2') or
file.endswith('.tar.bz2'):
+       elif unpack and (file.endswith('.tbz') or
file.endswith('.tbz2') or file.endswith('.tar.bz2')):
                cmd = 'bzip2 -dc %s | tar x --no-same-owner -f -' % file
-       elif file.endswith('.gz') or file.endswith('.Z') or file.endswith('.z'):
+       elif unpack and (file.endswith('.gz') or file.endswith('.Z')
or file.endswith('.z')):
                cmd = 'gzip -dc %s > %s' % (file, efile)
-       elif file.endswith('.bz2'):
+       elif unpack and file.endswith('.bz2'):
                cmd = 'bzip2 -dc %s > %s' % (file, efile)
-       elif file.endswith('.tar.xz'):
+       elif unpack and file.endswith('.tar.xz'):
                cmd = 'xz -dc %s | tar x --no-same-owner -f -' % file
-       elif file.endswith('.xz'):
+       elif unpack and file.endswith('.xz'):
                cmd = 'xz -dc %s > %s' % (file, efile)
-       elif file.endswith('.zip') or file.endswith('.jar'):
+       elif unpack and (file.endswith('.zip') or file.endswith('.jar')):
                cmd = 'unzip -q -o'
                (type, host, path, user, pswd, parm) = bb.decodeurl(url)
                if 'dos' in parm:
==================================

This is a learning experience for me so comments on how to submit
patches properly are very welcome :).

-Ash

--000325561ef628b54f048577942c
Content-Type: text/x-patch; charset=US-ASCII; name="nounpack.patch"
Content-Disposition: attachment; filename="nounpack.patch"
Content-Transfer-Encoding: base64
X-Attachment-Id: f_g8n9zbmg0

ZGlmZiAtLWdpdCBhL2NsYXNzZXMvYmFzZS5iYmNsYXNzIGIvY2xhc3Nlcy9iYXNlLmJiY2xhc3MK
aW5kZXggNGQ1ZDczZC4uNWIzZDkyZSAxMDA2NDQKLS0tIGEvY2xhc3Nlcy9iYXNlLmJiY2xhc3MK
KysrIGIvY2xhc3Nlcy9iYXNlLmJiY2xhc3MKQEAgLTE3MSwyMSArMTcxLDI5IEBAIGRlZiBvZV91
bnBhY2tfZmlsZShmaWxlLCBkYXRhLCB1cmwgPSBOb25lKToKIAllbHNlOgogCQllZmlsZSA9IGZp
bGUKIAljbWQgPSBOb25lCi0JaWYgZmlsZS5lbmRzd2l0aCgnLnRhcicpOgorCisgICAgICAgICMg
YWxsb3cgYSAnbm91bnBhY2s9MScgdXJsIHBhcmFtZXRlciB0byBwcmV2ZW50IHVucGFja2luZyBv
ZiBhcmNoaXZlcworICAgICAgICB1bnBhY2sgPSBUcnVlCisgICAgICAgICh0eXBlLCBob3N0LCBw
YXRoLCB1c2VyLCBwc3dkLCBwYXJtKSA9IGJiLmRlY29kZXVybCh1cmwpCisgICAgICAgIGlmICdu
b3VucGFjaycgaW4gcGFybToKKyAgICAgICAgICAgICAgICBpZiBwYXJtWydub3VucGFjayddOgor
ICAgICAgICAgICAgICAgICAgICAgICAgdW5wYWNrID0gRmFsc2UKKworCWlmIHVucGFjayBhbmQg
ZmlsZS5lbmRzd2l0aCgnLnRhcicpOgogCQljbWQgPSAndGFyIHggLS1uby1zYW1lLW93bmVyIC1m
ICVzJyAlIGZpbGUKLQllbGlmIGZpbGUuZW5kc3dpdGgoJy50Z3onKSBvciBmaWxlLmVuZHN3aXRo
KCcudGFyLmd6Jykgb3IgZmlsZS5lbmRzd2l0aCgnLnRhci5aJyk6CisJZWxpZiB1bnBhY2sgYW5k
IChmaWxlLmVuZHN3aXRoKCcudGd6Jykgb3IgZmlsZS5lbmRzd2l0aCgnLnRhci5neicpIG9yIGZp
bGUuZW5kc3dpdGgoJy50YXIuWicpKToKIAkJY21kID0gJ3RhciB4eiAtLW5vLXNhbWUtb3duZXIg
LWYgJXMnICUgZmlsZQotCWVsaWYgZmlsZS5lbmRzd2l0aCgnLnRieicpIG9yIGZpbGUuZW5kc3dp
dGgoJy50YnoyJykgb3IgZmlsZS5lbmRzd2l0aCgnLnRhci5iejInKToKKwllbGlmIHVucGFjayBh
bmQgKGZpbGUuZW5kc3dpdGgoJy50YnonKSBvciBmaWxlLmVuZHN3aXRoKCcudGJ6MicpIG9yIGZp
bGUuZW5kc3dpdGgoJy50YXIuYnoyJykpOgogCQljbWQgPSAnYnppcDIgLWRjICVzIHwgdGFyIHgg
LS1uby1zYW1lLW93bmVyIC1mIC0nICUgZmlsZQotCWVsaWYgZmlsZS5lbmRzd2l0aCgnLmd6Jykg
b3IgZmlsZS5lbmRzd2l0aCgnLlonKSBvciBmaWxlLmVuZHN3aXRoKCcueicpOgorCWVsaWYgdW5w
YWNrIGFuZCAoZmlsZS5lbmRzd2l0aCgnLmd6Jykgb3IgZmlsZS5lbmRzd2l0aCgnLlonKSBvciBm
aWxlLmVuZHN3aXRoKCcueicpKToKIAkJY21kID0gJ2d6aXAgLWRjICVzID4gJXMnICUgKGZpbGUs
IGVmaWxlKQotCWVsaWYgZmlsZS5lbmRzd2l0aCgnLmJ6MicpOgorCWVsaWYgdW5wYWNrIGFuZCBm
aWxlLmVuZHN3aXRoKCcuYnoyJyk6CiAJCWNtZCA9ICdiemlwMiAtZGMgJXMgPiAlcycgJSAoZmls
ZSwgZWZpbGUpCi0JZWxpZiBmaWxlLmVuZHN3aXRoKCcudGFyLnh6Jyk6CisJZWxpZiB1bnBhY2sg
YW5kIGZpbGUuZW5kc3dpdGgoJy50YXIueHonKToKIAkJY21kID0gJ3h6IC1kYyAlcyB8IHRhciB4
IC0tbm8tc2FtZS1vd25lciAtZiAtJyAlIGZpbGUKLQllbGlmIGZpbGUuZW5kc3dpdGgoJy54eicp
OgorCWVsaWYgdW5wYWNrIGFuZCBmaWxlLmVuZHN3aXRoKCcueHonKToKIAkJY21kID0gJ3h6IC1k
YyAlcyA+ICVzJyAlIChmaWxlLCBlZmlsZSkKLQllbGlmIGZpbGUuZW5kc3dpdGgoJy56aXAnKSBv
ciBmaWxlLmVuZHN3aXRoKCcuamFyJyk6CisJZWxpZiB1bnBhY2sgYW5kIChmaWxlLmVuZHN3aXRo
KCcuemlwJykgb3IgZmlsZS5lbmRzd2l0aCgnLmphcicpKToKIAkJY21kID0gJ3VuemlwIC1xIC1v
JwogCQkodHlwZSwgaG9zdCwgcGF0aCwgdXNlciwgcHN3ZCwgcGFybSkgPSBiYi5kZWNvZGV1cmwo
dXJsKQogCQlpZiAnZG9zJyBpbiBwYXJtOgo=

--000325561ef628b54f048577942c--
