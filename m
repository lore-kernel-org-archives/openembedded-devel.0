Received: from mail-iw0-f175.google.com ([209.85.214.175])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <raj.khem@gmail.com>) id 1OXA1t-00071L-A9
	for openembedded-devel@lists.openembedded.org;
	Fri, 09 Jul 2010 11:38:07 +0200
Received: by iwn34 with SMTP id 34so1985943iwn.6
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 09 Jul 2010 02:33:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:received:mime-version:received:in-reply-to
	:references:from:date:message-id:subject:to:cc:content-type;
	bh=34t5PHHE4iOHtWOEKE+D2F5H7axiddSSR61xdNHz2GM=;
	b=VEYVe+lp56qosokyLwegk4WiPxBAuVRaworWcoQklNskuW/KN+2Y1tuchUmRF5dP6z
	b3SkfyCkRc1dKUH4l8bYSjN1sqfKBme6gtfeN4JumKLF0gu4LgMs36L85g5sVVc9CVmW
	EFeIVJISzYvxCiZQ8GtKtQw6jHHTb+K5xFyD0=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc:content-type;
	b=ebBwfZedOpgC/D08ascbeVROEUkk89hARdkpyUcAQtujC3HBB/CQA0sdhBDE/Cjfbu
	csCYB/75nPKWmC+Ua8Vv5Zr7DV8ZB8V+Dq3IlB0Gud7tjq3cRnQQLC++qkXfOk5xRgYw
	FhtUW8FwJFmV8ox3d4755dzbzbdW5qBS8sink=
Received: by 10.231.161.73 with SMTP id q9mr8903381ibx.70.1278621131221; Thu, 
	08 Jul 2010 13:32:11 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.231.14.131 with HTTP; Thu, 8 Jul 2010 13:31:51 -0700 (PDT)
In-Reply-To: <20100708202835.GC23169@mx.loc>
References: <1278444743-4924-1-git-send-email-rep.dot.nop@gmail.com> 
	<1278444743-4924-4-git-send-email-rep.dot.nop@gmail.com>
	<AANLkTimnWBxCFMLlns8Q8LJ-3BvpWqqTNkqZ8ZlWbQdo@mail.gmail.com> 
	<20100708202835.GC23169@mx.loc>
From: Khem Raj <raj.khem@gmail.com>
Date: Thu, 8 Jul 2010 13:31:51 -0700
Message-ID: <AANLkTilRuu8FqF_Bz93wjjdm4047LJFe5N2Egs70Adlj@mail.gmail.com>
To: Bernhard Reutner-Fischer <rep.dot.nop@gmail.com>
X-SA-Exim-Connect-IP: 209.85.214.175
X-SA-Exim-Mail-From: raj.khem@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.5 required=5.0 tests=AWL,BAYES_00,SPF_PASS
	autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Cc: openembedded-devel@lists.openembedded.org
Subject: Re: [PATCH][v3 3/4] uClibc: redo configuration
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
X-List-Received-Date: Fri, 09 Jul 2010 09:38:07 -0000
X-Groupsio-MsgNum: 20831
Content-Type: multipart/mixed; boundary=001636e903105475e1048ae62e35

--001636e903105475e1048ae62e35
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

On Thu, Jul 8, 2010 at 1:28 PM, Bernhard Reutner-Fischer
<rep.dot.nop@gmail.com> wrote:
> On Thu, Jul 08, 2010 at 12:02:51PM -0700, Khem Raj wrote:
>>On Tue, Jul 6, 2010 at 12:32 PM, Bernhard Reutner-Fischer
>><rep.dot.nop@gmail.com> wrote:
>
>>> + =A0 =A0 =A0 uclibc_cfg('bx', =A0 =A0 =A0 =A0machine_features,'USE_BX'=
, cnf, rem)
>>
>>
>>
>>I would have a feature called 'nobx' because most of the machines
>>we support actively in OE has BX. With current state this needs to
>>be added to MACHINE features for almost all arm machines. We can instead
>>have nobx and keep USE_BX enabled and only disable it if nobx appears
>>in machine_features.
>
> I'd much prefer to stick bx into some generic arm include instead.
> What do you think?

I have added attached patch and turned bx into nobx and now all seems to be
ok


>
>> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 Otherwise I have tested the patc=
hes myself
>>and they seems to work well.
>>
>>I will push them once we have the bx turned into nobx
>>
>>I think you do not have a function to disable already enabled feature.
>
> the 'rem' below translates into sed /SOMETHING/d
> Can you elaborate?
> Except you mean DISTRO_FEATURES=3D"ipv4"
> and one of the gazillion distro-specific config snippets contain
> CONFIG_IPV6=3Dy
> and that is not disabled.. About all those distro hunks have to go
> anyway for they are redundant.
>
>>> + =A0 =A0 =A0 return "\n".join(cnf), "\n".join(rem)
>>> +# X, Y =3D ${@features_to_uclibc_settings(d)}
>>> +# unfortunately doesn't seem to work with bitbake, workaround:
>
> you said you saw an ICE with current uclibc master. Which arch and which
> versions of the toolchain did you use?
> FYI, i tested qemuarm, qemumips, qemuppc, qemux86 and (my local)
> qemux86_64 with
> PREFERRED_BINUTILS =3D "2.20.1" =B9)
> PREFERRED_GCC_VERSION =3D "4.5" =B2) =B3)
>
> and all of built fine for me.
>
> =B9) micro.conf incorrectly picks 2.19.51 per default, should be bumped
> =B2) micro.conf should also default to 4.5
> =B3) It would be great if we could settle on one scheme for
> =A0 binutils/gcc/libc version shorthands:
> =A0 PREFERRED_BINUTILS_VERSION _or_ PREFERRED_GCC, i'd go for
> =A0 PREFERRED_foo_VERSION, uniformly.
>

--001636e903105475e1048ae62e35
Content-Type: application/octet-stream; name=diff
Content-Disposition: attachment; filename=diff
Content-Transfer-Encoding: base64
X-Attachment-Id: f_gbe1zeat0

Y29tbWl0IGRjMWY3ZDdhYjlhZGRlZTBlNGZiZWIxMWQ3YjY5ZDc0ZTk0OTBkMTYKQXV0aG9yOiBL
aGVtIFJhaiA8cmFqLmtoZW1AZ21haWwuY29tPgpEYXRlOiAgIFRodSBKdWwgOCAxMzoyNDoyOSAy
MDEwIC0wNzAwCgogICAgdWNsaWJjOiBSZXBsYWNlIGJ4IHdpdGggbm9ieCBmZWF0dXJlLgogICAg
CiAgICAqIEFkZCBuZXcgZnVuY3Rpb24gdWNsaWJjX2NmZ19kaXNhYmxlIHRvIGRpc2FibGUgYSBm
ZWF0dXJlIGluIC5jb25maWcKICAgICogUmVuYW1lIHVjbGliY19jZmcgdG8gdWNsaWJjX2NmZ19l
bmFibGUKICAgICogQnVtcCBTUkNfUkVWIGZvciB1Y2xpYmNfZ2l0CiAgICAqIFBhc3MgU1NQX0FM
TF9DRkxBR1M9JHtUQVJHRVRfTElOS19IQVNIX1NUWUxFfSBvdGhlcndpc2UKICAgICAgdXRpbHMg
ZG9udCBnZXQgdGhlIGhhc2hfc3R5bGUgcmlnaHQgYW5kIFFBIGNvbXBsYWlucy4KICAgIAogICAg
U2lnbmVkLW9mZi1ieTogS2hlbSBSYWogPHJhai5raGVtQGdtYWlsLmNvbT4KCmRpZmYgLS1naXQg
YS9yZWNpcGVzL3VjbGliYy91Y2xpYmMtY29uZmlnLmluYyBiL3JlY2lwZXMvdWNsaWJjL3VjbGli
Yy1jb25maWcuaW5jCmluZGV4IDgyZGZjZmUuLjgyNGQ3OTQgMTAwNjQ0Ci0tLSBhL3JlY2lwZXMv
dWNsaWJjL3VjbGliYy1jb25maWcuaW5jCisrKyBiL3JlY2lwZXMvdWNsaWJjL3VjbGliYy1jb25m
aWcuaW5jCkBAIC04Miw3ICs4Miw3IEBAIGRlZiBtYXBfdWNsaWJjX2VuZGlhbihhLCBkKToKIGV4
cG9ydCBVQ0xJQkNfRU5ESUFOID0gIiR7QG1hcF91Y2xpYmNfZW5kaWFuKGJiLmRhdGEuZ2V0VmFy
KCdUQVJHRVRfQVJDSCcsIGQsIDEpLCBkKX0iCiAKICMgaW50ZXJuYWwgaGVscGVyCi1kZWYgdWNs
aWJjX2NmZyhmZWF0dXJlLCBmZWF0dXJlcywgdG9rZW5zLCBjbmYsIHJlbSk6CitkZWYgdWNsaWJj
X2NmZ19lbmFibGUoZmVhdHVyZSwgZmVhdHVyZXMsIHRva2VucywgY25mLCByZW0pOgogCWlmIHR5
cGUodG9rZW5zKSA9PSB0eXBlKCIiKToKIAkJdG9rZW5zID0gW3Rva2Vuc10KIAlyZW0uZXh0ZW5k
KFsnL15bIyBdKicgKyB0b2tlbiArICdbID1dL2QnIGZvciB0b2tlbiBpbiB0b2tlbnNdKQpAQCAt
OTAsMTYgKzkwLDI1IEBAIGRlZiB1Y2xpYmNfY2ZnKGZlYXR1cmUsIGZlYXR1cmVzLCB0b2tlbnMs
IGNuZiwgcmVtKToKIAkJY25mLmV4dGVuZChbdG9rZW4gKyAnPXknIGZvciB0b2tlbiBpbiB0b2tl
bnNdKQogCWVsc2U6CiAJCWNuZi5leHRlbmQoWycjICcgKyB0b2tlbiArICcgaXMgbm90IHNldCcg
Zm9yIHRva2VuIGluIHRva2Vuc10pCisKK2RlZiB1Y2xpYmNfY2ZnX2Rpc2FibGUoZmVhdHVyZSwg
ZmVhdHVyZXMsIHRva2VucywgY25mLCByZW0pOgorCWlmIHR5cGUodG9rZW5zKSA9PSB0eXBlKCIi
KToKKwkJdG9rZW5zID0gW3Rva2Vuc10KKwlyZW0uZXh0ZW5kKFsnL15bIyBdKicgKyB0b2tlbiAr
ICdbID1dL2QnIGZvciB0b2tlbiBpbiB0b2tlbnNdKQorCWlmIHR5cGUoZmVhdHVyZXMpID09IHR5
cGUoW10pIGFuZCBmZWF0dXJlIGluIGZlYXR1cmVzOgorCQljbmYuZXh0ZW5kKFsnIyAnICsgdG9r
ZW4gKyAnIGlzIG5vdCBzZXQnIGZvciB0b2tlbiBpbiB0b2tlbnNdKQorCWVsc2U6CisJCWNuZi5l
eHRlbmQoW3Rva2VuICsgJz15JyBmb3IgdG9rZW4gaW4gdG9rZW5zXSkKICMgTWFwIGRpc3RybyBh
bmQgbWFjaGluZSBmZWF0dXJlcyB0byBjb25maWcgc2V0dGluZ3MKIGRlZiBmZWF0dXJlc190b191
Y2xpYmNfc2V0dGluZ3MoZCk6CiAJY25mLCByZW0gPSAoW10sIFtdKQogCWRpc3Ryb19mZWF0dXJl
cyA9IGJiLmRhdGEuZ2V0VmFyKCdESVNUUk9fRkVBVFVSRVMnLCBkKS5zcGxpdCgpCiAJbWFjaGlu
ZV9mZWF0dXJlcyA9IGJiLmRhdGEuZ2V0VmFyKCdNQUNISU5FX0ZFQVRVUkVTJywgZCkuc3BsaXQo
KQotCXVjbGliY19jZmcoJ2lwdjQnLCAgICAgIGRpc3Ryb19mZWF0dXJlcywgJ1VDTElCQ19IQVNf
SVBWNCcsIGNuZiwgcmVtKQotCXVjbGliY19jZmcoJ2lwdjYnLCAgICAgIGRpc3Ryb19mZWF0dXJl
cywgJ1VDTElCQ19IQVNfSVBWNicsIGNuZiwgcmVtKQotCXVjbGliY19jZmcoJ2xhcmdlZmlsZScs
IGRpc3Ryb19mZWF0dXJlcywgJ1VDTElCQ19IQVNfTEZTJywgY25mLCByZW0pCi0JdWNsaWJjX2Nm
ZygnbmxzJywgICAgICAgZGlzdHJvX2ZlYXR1cmVzLCAnVUNMSUJDX0hBU19MT0NBTEUnLCBjbmYs
IHJlbSkKLQl1Y2xpYmNfY2ZnKCdieCcsICAgICAgICBtYWNoaW5lX2ZlYXR1cmVzLCdVU0VfQlgn
LCBjbmYsIHJlbSkKKwl1Y2xpYmNfY2ZnX2VuYWJsZSgnaXB2NCcsICAgICAgZGlzdHJvX2ZlYXR1
cmVzLCAnVUNMSUJDX0hBU19JUFY0JywgY25mLCByZW0pCisJdWNsaWJjX2NmZ19lbmFibGUoJ2lw
djYnLCAgICAgIGRpc3Ryb19mZWF0dXJlcywgJ1VDTElCQ19IQVNfSVBWNicsIGNuZiwgcmVtKQor
CXVjbGliY19jZmdfZW5hYmxlKCdsYXJnZWZpbGUnLCBkaXN0cm9fZmVhdHVyZXMsICdVQ0xJQkNf
SEFTX0xGUycsIGNuZiwgcmVtKQorCXVjbGliY19jZmdfZW5hYmxlKCdubHMnLCAgICAgICBkaXN0
cm9fZmVhdHVyZXMsICdVQ0xJQkNfSEFTX0xPQ0FMRScsIGNuZiwgcmVtKQorCXVjbGliY19jZmdf
ZGlzYWJsZSgnbm9ieCcsICAgICAgbWFjaGluZV9mZWF0dXJlcywnVVNFX0JYJywgY25mLCByZW0p
CiAJcmV0dXJuICJcbiIuam9pbihjbmYpLCAiXG4iLmpvaW4ocmVtKQogIyBYLCBZID0gJHtAZmVh
dHVyZXNfdG9fdWNsaWJjX3NldHRpbmdzKGQpfQogIyB1bmZvcnR1bmF0ZWx5IGRvZXNuJ3Qgc2Vl
bSB0byB3b3JrIHdpdGggYml0YmFrZSwgd29ya2Fyb3VuZDoK

--001636e903105475e1048ae62e35--
