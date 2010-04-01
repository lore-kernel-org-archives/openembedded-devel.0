Received: from mail-gw0-f47.google.com ([74.125.83.47])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <ryan@trolocsis.com>) id 1NxN19-0001i2-Rv
	for openembedded-devel@lists.openembedded.org;
	Thu, 01 Apr 2010 18:13:17 +0200
Received: by gwj21 with SMTP id 21so872793gwj.6
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 01 Apr 2010 09:09:58 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.90.70.4 with HTTP; Thu, 1 Apr 2010 09:09:56 -0700 (PDT)
In-Reply-To: <t2n46a47f951003312246y97e7b196m59c6d8136580adb0@mail.gmail.com>
References: <t2n46a47f951003312246y97e7b196m59c6d8136580adb0@mail.gmail.com>
Date: Thu, 1 Apr 2010 11:09:56 -0500
Received: by 10.91.109.12 with SMTP id l12mr2039159agm.33.1270138196797; Thu, 
	01 Apr 2010 09:09:56 -0700 (PDT)
Message-ID: <p2k46a47f951004010909sfb05675bx2ad6274204621bd6@mail.gmail.com>
From: Ryan Phillips <ryan@trolocsis.com>
To: openembedded-users@linuxtogo.org, 
	openembedded-devel@lists.openembedded.org
X-SA-Exim-Connect-IP: 74.125.83.47
X-SA-Exim-Mail-From: ryan@trolocsis.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=BAYES_00 autolearn=ham
	version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: error building meta-toolchain for powerpc 405
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
X-List-Received-Date: Thu, 01 Apr 2010 16:13:17 -0000
X-Groupsio-MsgNum: 18349
Content-Type: multipart/mixed; boundary=0016e64615620935a104832f18b8

--0016e64615620935a104832f18b8
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

On Thu, Apr 1, 2010 at 12:46 AM, Ryan Phillips <ryan@trolocsis.com> wrote:
> Hi All,
>
> I'm trying to compile a meta-toolchain for PowerPC 405 with GCC 4.3.3
> (and I have also tried 4.4.1). Everything goes smoothly until bitbake
> gets to gcc-cross-sdk-4.3.3 and it errors out... I'm not exactly sure
> what the error is.
>
> I have uploaded the log file to:
> =A0 http://hera.kimaker.com/~rphillips/log-results.bz2
>

Patch attached... It looks like gcc-package-sdk needs to have the
strips be optional. Is this the correct fix or should libstdc++
already exist?

Related Commit: 8c4198fc

Regards,
Ryan

--0016e64615620935a104832f18b8
Content-Type: application/octet-stream; 
	name="0001-Fix-meta-toolchain-generation.patch"
Content-Disposition: attachment; 
	filename="0001-Fix-meta-toolchain-generation.patch"
Content-Transfer-Encoding: base64
X-Attachment-Id: f_g7hrb7a90

RnJvbSAxMWMyMmVkZTc5MGQ1NGJkODU3ZWQxMmNmNGEwNDU1ZjFkZjM2MWYxIE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBSeWFuIFBoaWxsaXBzIDxyeWFuX2RfcGhpbGxpcHNAZGVsbC5j
b20+CkRhdGU6IFRodSwgMSBBcHIgMjAxMCAxMTowMDozMiAtMDUwMApTdWJqZWN0OiBbUEFUQ0hd
IEZpeCBtZXRhLXRvb2xjaGFpbiBnZW5lcmF0aW9uCgotLS0KIHJlY2lwZXMvZ2NjL2djYy1wYWNr
YWdlLXNkay5pbmMgfCAgICA0ICsrLS0KIDEgZmlsZXMgY2hhbmdlZCwgMiBpbnNlcnRpb25zKCsp
LCAyIGRlbGV0aW9ucygtKQoKZGlmZiAtLWdpdCBhL3JlY2lwZXMvZ2NjL2djYy1wYWNrYWdlLXNk
ay5pbmMgYi9yZWNpcGVzL2djYy9nY2MtcGFja2FnZS1zZGsuaW5jCmluZGV4IGRjZjJjODkuLmNl
N2FmNDAgMTAwNjQ0Ci0tLSBhL3JlY2lwZXMvZ2NjL2djYy1wYWNrYWdlLXNkay5pbmMKKysrIGIv
cmVjaXBlcy9nY2MvZ2NjLXBhY2thZ2Utc2RrLmluYwpAQCAtNTUsOCArNTUsOCBAQCBkb19pbnN0
YWxsICgpIHsKIAkjIE1hbnVhbGx5IHJ1biB0aGUgdGFyZ2V0IHN0cmlwcGVyIHNpbmNlIHdlIHdv
bid0IGdldCBpdCBydW4gYnkKIAkjIHRoZSBwYWNrYWdpbmcuCiAJaWYgWyAieCR7T0xEX0lOSElC
SVRfUEFDS0FHRV9TVFJJUH0iICE9ICJ4MSIgXTsgdGhlbgotCQkke1RBUkdFVF9QUkVGSVh9c3Ry
aXAgJHtEfSR7cHJlZml4fS8ke1RBUkdFVF9TWVN9L2xpYi9saWJzdGRjKysuc28uKgorCQkke1RB
UkdFVF9QUkVGSVh9c3RyaXAgJHtEfSR7cHJlZml4fS8ke1RBUkdFVF9TWVN9L2xpYi9saWJzdGRj
Kysuc28uKiB8fCB0cnVlCiAJCSR7VEFSR0VUX1BSRUZJWH1zdHJpcCAke0R9JHtwcmVmaXh9LyR7
VEFSR0VUX1NZU30vbGliL2xpYmcyYy5zby4qIHx8IHRydWUKLQkJJHtUQVJHRVRfUFJFRklYfXN0
cmlwICR7RH0ke3ByZWZpeH0vJHtUQVJHRVRfU1lTfS9saWIvbGliZ2NjX3Muc28uKgorCQkke1RB
UkdFVF9QUkVGSVh9c3RyaXAgJHtEfSR7cHJlZml4fS8ke1RBUkdFVF9TWVN9L2xpYi9saWJnY2Nf
cy5zby4qIHx8IHRydWUKIAlmaQogfQotLSAKMS43LjAuMQoK

--0016e64615620935a104832f18b8--
