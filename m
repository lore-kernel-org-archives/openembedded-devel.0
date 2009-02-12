Received: from [209.85.198.245] (helo=rv-out-0708.google.com)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <raj.khem@gmail.com>) id 1LXU99-00023u-B7
	for openembedded-devel@lists.openembedded.org;
	Thu, 12 Feb 2009 06:29:59 +0100
Received: by rv-out-0708.google.com with SMTP id b17so224036rvf.12
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 11 Feb 2009 21:28:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:received:in-reply-to:references
	:date:message-id:subject:from:to:content-type;
	bh=VbbOw3zUcg0yXEwAHtyT5ICpwlZdA27W6b+Fv6qFX1E=;
	b=q9BkkJBga2mrlqUMBYTI600VhWifVog+Jwcp9w6SNmMGcC3apjU5x9culxjj2FK2/q
	9vodIht5ba+hgQMGMRIltxeTpkjsBWWycosTprKuX/ub4h36EcHVAS4AnzHm0AVw+qCH
	TxmyvKfFJDsPq5xYqTUffJY+rYJWqKO5ziC58=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type;
	b=VweOgrGY2yqHUFP5OUKPCzj3ZZrjZ5CtMasLzB+HzF5HkAPc/hgEMOApoDdH9grD71
	b90mdoTrSaLiRRN9oV7Mt2UZEk7dCYACzkngKmDtzl+bJGAXtndZe2LTHsXB30/CG0lX
	GFvngg8jD329fa0YURC4IHa9HSsEPgkfzD3sQ=
MIME-Version: 1.0
Received: by 10.141.33.19 with SMTP id l19mr300162rvj.294.1234416525290; Wed, 
	11 Feb 2009 21:28:45 -0800 (PST)
In-Reply-To: <1232958250.4890.104.camel@lenovo.internal.reciva.com>
References: <20090126074953.GA26318@gmail.com>
	<1232958250.4890.104.camel@lenovo.internal.reciva.com>
Date: Wed, 11 Feb 2009 21:28:45 -0800
Message-ID: <19c1b8a90902112128y12c2e680y7b1624bfd9c7878a@mail.gmail.com>
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: Re: fix for strl functions in alsautils
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
X-List-Received-Date: Thu, 12 Feb 2009 05:30:00 -0000
X-Groupsio-MsgNum: 7621
Content-Type: multipart/mixed; boundary=000e0cd1452e7eaebc0462b1fe16

--000e0cd1452e7eaebc0462b1fe16
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On Mon, Jan 26, 2009 at 12:24 AM, Phil Blundell <pb@reciva.com> wrote:
> On Sun, 2009-01-25 at 23:49 -0800, Khem Raj wrote:
>> * These funtions are provided by C libraries like uclibc
>>         Declaring them static here causes static not static declaration
>>         issues reported by gcc.
>> [...]
>> + #ifdef __GLIBC__
>> +-static size_t strlcpy(char *dst, const char *src, size_t size)
>> ++size_t strlcpy(char *dst, const char *src, size_t size)
>> + {
>
> Wouldn't it be better to change that "#ifdef __GLIBC__" to something
> more appropriate?  With your change it looks like you will still get
> useless copies of these functions in the resulting binaries.

Here is alternative patch. Somehow I am having problem sending emails.


Thanks

-Khem

--000e0cd1452e7eaebc0462b1fe16
Content-Type: text/x-patch; charset=US-ASCII; name="alsa-utils-autoconf-strl-funcs.patch"
Content-Disposition: attachment; 
	filename="alsa-utils-autoconf-strl-funcs.patch"
Content-Transfer-Encoding: base64
X-Attachment-Id: f_fr2zoz5x0

SW5kZXg6IGFsc2EtdXRpbHMtMS4wLjE4L2Fsc2FjdGwvaW5pdF9zeXNkZXBzLmMKPT09PT09PT09
PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09
PQotLS0gYWxzYS11dGlscy0xLjAuMTgub3JpZy9hbHNhY3RsL2luaXRfc3lzZGVwcy5jCTIwMDgt
MTAtMjkgMDU6NDI6MTEuMDAwMDAwMDAwIC0wNzAwCisrKyBhbHNhLXV0aWxzLTEuMC4xOC9hbHNh
Y3RsL2luaXRfc3lzZGVwcy5jCTIwMDktMDItMTAgMjM6MTc6NDcuMDAwMDAwMDAwIC0wODAwCkBA
IC0xNyw3ICsxNyw3IEBACiAgKgogICovCiAKLSNpZmRlZiBfX0dMSUJDX18KKyNpZiAhSEFWRV9T
VFJMQ1BZCiBzdGF0aWMgc2l6ZV90IHN0cmxjcHkoY2hhciAqZHN0LCBjb25zdCBjaGFyICpzcmMs
IHNpemVfdCBzaXplKQogewogCXNpemVfdCBieXRlcyA9IDA7CkBAIC0zNiw3ICszNiwxMCBAQAog
CQkqcSA9ICdcMCc7CiAJcmV0dXJuIGJ5dGVzOwogfQorI2VuZGlmIC8qICFIQVZFX1NUUkxDUFkg
Ki8KIAorCisjaWYgIUhBVkVfU1RSTENBVAogc3RhdGljIHNpemVfdCBzdHJsY2F0KGNoYXIgKmRz
dCwgY29uc3QgY2hhciAqc3JjLCBzaXplX3Qgc2l6ZSkKIHsKIAlzaXplX3QgYnl0ZXMgPSAwOwpA
QCAtNjAsNCArNjMsNCBAQAogCSpxID0gJ1wwJzsKIAlyZXR1cm4gYnl0ZXM7CiB9Ci0jZW5kaWYg
LyogX19HTElCQ19fICovCisjZW5kaWYgLyogIUhBVkVfU1RSTENBVCAqLwpJbmRleDogYWxzYS11
dGlscy0xLjAuMTgvY29uZmlndXJlLmluCj09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09
PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT0KLS0tIGFsc2EtdXRpbHMtMS4wLjE4
Lm9yaWcvY29uZmlndXJlLmluCTIwMDgtMTAtMjkgMDU6NDg6MDEuMDAwMDAwMDAwIC0wNzAwCisr
KyBhbHNhLXV0aWxzLTEuMC4xOC9jb25maWd1cmUuaW4JMjAwOS0wMi0xMCAyMzowMjowNy4wMDAw
MDAwMDAgLTA4MDAKQEAgLTYsNyArNiw3IEBACiAKIEFNX0dOVV9HRVRURVhUKFtleHRlcm5hbF0p
CiBBTV9HTlVfR0VUVEVYVF9WRVJTSU9OKFswLjE1XSkKLQorQUNfQ0hFQ0tfRlVOQ1Moc3RybGNh
dCBzdHJsY3B5KQogZG5sIENoZWNrcyBmb3IgcHJvZ3JhbXMuCiAKIGRubCB0cnkgdG8gZ3VlcyBj
cm9zcy1jb21waWxlciBpZiBub3Qgc2V0Cg==

--000e0cd1452e7eaebc0462b1fe16--
