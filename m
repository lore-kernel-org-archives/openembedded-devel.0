Received: from mail-yx0-f194.google.com ([209.85.210.194])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <aalonso00@gmail.com>) id 1NtlMh-0003mR-Ru
	for openembedded-devel@lists.openembedded.org;
	Mon, 22 Mar 2010 18:24:41 +0100
Received: by yxe32 with SMTP id 32so2840666yxe.24
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 22 Mar 2010 10:21:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:received:in-reply-to:references
	:date:message-id:subject:from:to:content-type;
	bh=1e37e2pyyfZWAqG1UUUiu717RiIdvV+cKoZsEsX2rz0=;
	b=HFGSC0ih9/CDhmUHkTzKIlrC+mRnbHZfHQUBLPKUhBzDYqurXZjlXlEtb7paNHX6+t
	+6B/kxSp5dJME3Lr3WdAjWLRvb2i2aUP5y5S+VI0K5jOjLN9Ml7ieRPtPm1Ks4I8NwHv
	yYCgKV5o0+OCLuj5NeEufl8m/LXc+cqhOpl4Q=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type;
	b=lSnveXQ22iIDkajIUF6v3hoBZAiKqpY6lK/aygKT5JqX0msNyBkQ2IjyX2dBz8rwHW
	0ePcUbIiLkGKC1u0nXBtDvWs+jbv0uY127DFMfU62kP/PvGLqE7gyCoWoi09ROGC5WoX
	3cdhFRxfueicGGTT2LvrhgLi32+Js2m1p81Wo=
MIME-Version: 1.0
Received: by 10.90.222.9 with SMTP id u9mr4451268agg.89.1269278484492; Mon, 22 
	Mar 2010 10:21:24 -0700 (PDT)
In-Reply-To: <20100321112854.GB7325@excalibur.local>
References: <openembedded-devel@lists.openembedded.org>
	<1269019049-25807-1-git-send-email-aalonso00@gmail.com>
	<20100321112854.GB7325@excalibur.local>
Date: Mon, 22 Mar 2010 11:21:24 -0600
Message-ID: <d1ded4381003221021n29191b3ch9e0e61b81f4cabb4@mail.gmail.com>
From: Adrian Alonso <aalonso00@gmail.com>
To: openembedded-devel@lists.openembedded.org
X-SA-Exim-Connect-IP: 209.85.210.194
X-SA-Exim-Mail-From: aalonso00@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=BAYES_00,HTML_MESSAGE,
	SPF_PASS autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
X-Content-Filtered-By: Mailman/MimeDel 2.1.11
Subject: Re: [PATCH] u-boot_git.bb: add xilinx-ml507 support
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
X-List-Received-Date: Mon, 22 Mar 2010 17:24:41 -0000
X-Groupsio-MsgNum: 17986
Content-Type: multipart/mixed; boundary=001636283a3c308350048266edc0

--001636283a3c308350048266edc0
Content-Type: text/plain; charset=ISO-8859-1

HI,

Fix previous error a patch should be at patchqueue, also is attached.

u-boot source code provides a parameter definition for a hardware reference
design
documented at [1]; Even trying to replicating this hardware project it would
not necessary
match the hardware address model used by u-boot so is safer to overwrite
this header file (xparameters.h);
Also u-boot expects a set of macros that are not generated whit xilinx
tools, and I append them
at the end of the header file, I know this is ugly but there's no way to
provide a patch since the
header file is generated based on the hardware modules included in the
project.

This probably can be included in xilinx-bsp.bbclass but I will need to
detect when u-boot or linux-kernel
is inheriting the class to perform the right action. But at the moment I
don't know ho to do it.


[1] http://xilinx.wikidot.com/u-boot

<http://xilinx.wikidot.com/u-boot>Regards

On Sun, Mar 21, 2010 at 5:28 AM, Stefan Schmidt
<stefan@datenfreihafen.org>wrote:

> Hello.
>
> The first part, PR and SRCREV, is obviously fine. The second part raises a
> question here. If it is preferred to have the xparameters header file from
> the
> BSP would it make more sense to have it in OE? Be it a package or just the
> file.
>
> The patch also has the problem that it does not work if XILINX_BSP_PATH is
> not
> set. Your test in deploy if the directory exists triggers this here:
>
> NOTE: Running task 1042 of 1048 (ID: 11,
>
> /home/stefan/Projekte/OpenEmbedded/build/openmoko/openembedded/recipes/u-boot/
> u-boot_git.bb,
> do_deploy)
> ERROR: function do_deploy failed
> ERROR: log data follows
>
> (/home/stefan/Projekte/OpenEmbedded/build/openmoko/tmp/work/xilinx-ml507-angstrom-linux/u-boot-git-r43/temp/log.do_deploy.19446)
> | NOTE: Installing u-boot elf image in bsp path
> | install: cannot create regular file `/u-boot': Permission denied
>
> The variable is empty and test thinks that is fine and wants to install the
> u-boot into / as no other path is set. Please fix, resend and I'll apply
> it.
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

--001636283a3c308350048266edc0
Content-Type: text/x-patch; charset=US-ASCII; 
	name="0001-u-boot_git.bb-add-xilinx-ml507-support.patch"
Content-Disposition: attachment; 
	filename="0001-u-boot_git.bb-add-xilinx-ml507-support.patch"
Content-Transfer-Encoding: base64
X-Attachment-Id: f_g73jwd7s0

RnJvbSBjM2RhMDE5OTgwYTlhYTJiMjdhODZiMWM3MDMwOThkNjUzMzAzOWJiIE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBBZHJpYW4gQWxvbnNvIDxhYWxvbnNvMDBAZ21haWwuY29tPgpE
YXRlOiBTdW4sIDIxIE1hciAyMDEwIDIzOjQ2OjM5IC0wNjAwClN1YmplY3Q6IFtQQVRDSCB2Ml0g
dS1ib290X2dpdC5iYjogYWRkIHhpbGlueCBtbDUwNyBzdXBwb3J0CgoqIEJhc2VkIG9uIHhpbGlu
eCBvZmZpY2lhbCByZXBvcwoqIElmIGEgaGFyZHdhcmUgcHJvamVjdCBkaXIgaXMgc2V0IGluIGxv
Y2FsLmNvbmYgWElMSU5YX0JTUF9QQVRICiogaXQgd2lsbCBvdmVyIHdyaXRlIHhwYXJhbWV0ZXJz
IGhlYWRlciBhbmQgYXBwZW5kIHNvbWUgY2Fub25pY2FsCiogZGVmaW5pdGlvbnMuIEl0IGFsc28g
aW5zdGFsbCB1LWJvb3QgZWxmIGV4ZWN1dGFibGUgZm9yIGJhcmUgbWV0YWwKKiBleGVjdXRpb24s
IGVhcmx5IGRldmVsb3BtZW50IHN0YWdlcy4KClNpZ25lZC1vZmYtYnk6IEFkcmlhbiBBbG9uc28g
PGFhbG9uc28wMEBnbWFpbC5jb20+Ci0tLQogcmVjaXBlcy91LWJvb3QvdS1ib290X2dpdC5iYiB8
ICAgMjEgKysrKysrKysrKysrKysrKysrKystCiAxIGZpbGVzIGNoYW5nZWQsIDIwIGluc2VydGlv
bnMoKyksIDEgZGVsZXRpb25zKC0pCgpkaWZmIC0tZ2l0IGEvcmVjaXBlcy91LWJvb3QvdS1ib290
X2dpdC5iYiBiL3JlY2lwZXMvdS1ib290L3UtYm9vdF9naXQuYmIKaW5kZXggZmI4MWNhZi4uOTI4
NjQyZCAxMDA2NDQKLS0tIGEvcmVjaXBlcy91LWJvb3QvdS1ib290X2dpdC5iYgorKysgYi9yZWNp
cGVzL3UtYm9vdC91LWJvb3RfZ2l0LmJiCkBAIC0xLDUgKzEsNSBAQAogcmVxdWlyZSB1LWJvb3Qu
aW5jCi1QUiA9InI0MiIKK1BSID0icjQzIgogCiBGSUxFU1BBVEhQS0cgPS4gInUtYm9vdC1naXQ6
IgogCkBAIC0yMDcsNiArMjA3LDkgQEAgU1JDX1VSSV9hcHBlbmRfYzd4MCA9ICJmaWxlOi8vcGRh
WHJvbS11LWJvb3QucGF0Y2g7cGF0Y2g9MSBcCiBTUkNfVVJJX3NoZWV2YXBsdWcgPSAiZ2l0Oi8v
Z2l0LmRlbnguZGUvdS1ib290LW1hcnZlbGwuZ2l0O3Byb3RvY29sPWdpdDticmFuY2g9dGVzdGlu
ZyIKIFNSQ1JFVl9zaGVldmFwbHVnID0gIjExOWI5OTQyZGEyZTQ1MGQ0ZTUyNWZjMDA0MjA4ZGQ3
ZjdkMDYyZTAiCiAKK1NSQ19VUklfeGlsaW54LW1sNTA3ID0gImdpdDovL2dpdC54aWxpbnguY29t
L3UtYm9vdC14bG54LmdpdDtwcm90b2NvbD1naXQiCitTUkNSRVZfeGlsaW54LW1sNTA3ID0gIjI2
ZTk5OTY1MGNmNzdjMTZmMzNjNTgwYWJhYWRhYjI1MzJmNWU4YjIiCisKIFMgPSAiJHtXT1JLRElS
fS9naXQiCiAKIApAQCAtMjM3LDMgKzI0MCwxOSBAQCBkb19kZXBsb3lfcHJlcGVuZF9taW5pMjQ0
MCgpIHsKIGRvX2RlcGxveV9wcmVwZW5kX21pY3JvMjQ0MCgpIHsKIAljcCAke1N9L3UtYm9vdC1u
YW5kMTZrLmJpbiAke1N9L3UtYm9vdC5iaW4KIH0KKworZG9fY29uZmlndXJlX3ByZXBlbmRfeGls
aW54LW1sNTA3KCkgeworaWYgWyAtZSAiJHtYSUxJTlhfQlNQX1BBVEh9L3BwYzQ0MF8wL2luY2x1
ZGUveHBhcmFtZXRlcnMuaCIgXTsgdGhlbgorICAgIGNwICR7WElMSU5YX0JTUF9QQVRIfS9wcGM0
NDBfMC9pbmNsdWRlL3hwYXJhbWV0ZXJzLmggXAorICAgICR7U30vYm9hcmQveGlsaW54L21sNTA3
CisgICAgZWNobyAiI2RlZmluZSBYUEFSX1BMQl9DTE9DS19GUkVRX0haIFhQQVJfQ1BVX1BQQzQ0
MF9NUExCX0ZSRVFfSFoKKyNkZWZpbmUgWFBBUl9DT1JFX0NMT0NLX0ZSRVFfSFogWFBBUl9DUFVf
UFBDNDQwX0NPUkVfQ0xPQ0tfRlJFUV9IWgorI2RlZmluZSBYUEFSX1BDSV8wX0NMT0NLX0ZSRVFf
SFogICAgMCIgPj4gJHtTfS9ib2FyZC94aWxpbngvbWw1MDcveHBhcmFtZXRlcnMuaAorZmkKK30K
KworZG9fZGVwbG95X3ByZXBlbmRfeGlsaW54LW1sNTA3KCkgeworaWYgWyAtZCAiJHtYSUxJTlhf
QlNQX1BBVEh9IiBdOyB0aGVuCisgICAgaW5zdGFsbCAke1N9L3UtYm9vdCAke1hJTElOWF9CU1Bf
UEFUSH0KK2ZpCit9Ci0tIAoxLjYuNi4xCgo=

--001636283a3c308350048266edc0--
