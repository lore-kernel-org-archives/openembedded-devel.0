Received: from mail-iw0-f175.google.com ([209.85.223.175])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <raj.khem@gmail.com>) id 1NYM6p-0003G5-Kv
	for openembedded-devel@lists.openembedded.org;
	Fri, 22 Jan 2010 17:11:47 +0100
Received: by iwn5 with SMTP id 5so1078207iwn.24
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 22 Jan 2010 08:09:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:received:in-reply-to:references
	:date:message-id:subject:from:to:content-type
	:content-transfer-encoding;
	bh=I5cUyt3Pk6l5mSvFwNeee2EmL9ZYIZ7AI8FnEmux7hU=;
	b=HdUmEJCMDlt/4NLZqgRR/iaY3jb5qs9rLZbfRrUsIFemQ9QEuD6Bj204q6EBwG3TrL
	zoo9QHkdg44avSDYtV/2nHJjCwJPWNWgg2tVAo13iPPYFV9k2JiiAtAXkE2tymchpKj6
	JolfnEuYfp0VmKhQ/ajXOyxoAnr/5VUMDSU70=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type:content-transfer-encoding;
	b=mJvqA94UPaa+J3FSOGLhgaPpkmIfeV0zL3WpJn9CXtx50PP6A1cUKTlOY5AWbXud98
	rHKXuTtGMlCaanvvQiJ+8vVGMcjcSjjBddr/cxVgbQgE87ADLIIDBgzTWz/MFHQx81fe
	ANGFo48FfY9yBpgntgKFR5SbVOPn5S4n8cawQ=
MIME-Version: 1.0
Received: by 10.231.144.81 with SMTP id y17mr3232724ibu.99.1264176565157; Fri, 
	22 Jan 2010 08:09:25 -0800 (PST)
In-Reply-To: <4B59BEB2.6080805@balister.org>
References: <19c1b8a91001212252u260f854enc50a9cc8f44099b4@mail.gmail.com>
	<1264149016-18488-1-git-send-email-marcin@juszkiewicz.com.pl>
	<4B59BEB2.6080805@balister.org>
Date: Fri, 22 Jan 2010 08:09:25 -0800
Message-ID: <19c1b8a91001220809u3289d168x576eee65344334d6@mail.gmail.com>
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
X-SA-Exim-Connect-IP: 209.85.223.175
X-SA-Exim-Mail-From: raj.khem@gmail.com
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: No (on linuxtogo.org); Unknown failure
Subject: Re: [PATCH] ruby-native: fix building with gcc 4.4.x
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
X-List-Received-Date: Fri, 22 Jan 2010 16:11:48 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

On Fri, Jan 22, 2010 at 7:05 AM, Philip Balister <philip@balister.org> wrot=
e:
> On 01/22/2010 03:30 AM, Marcin Juszkiewicz wrote:
>>
>> From: Marcin Juszkiewicz<marcin@buglabs.net>
>>
>> Looks like gcc 4.4.x do not like the way Ruby programmers used
>> preprocessor.
>>
>> This change is not present in .dev due to different versions of Ruby.
>>
>> Signed-off-by: Marcin Juszkiewicz<marcin@buglabs.net>
>
> Acked-by: Philip Balister <philip@balister.org>
>

Acked-by: Khem Raj <raj.khem@gmail.com>
>
>> ---
>> =A0recipes/ruby/files/gcc44.patch =A0 =A0| =A0 19 +++++++++++++++++++
>> =A0recipes/ruby/ruby-native_1.8.5.bb | =A0 =A05 +++++
>> =A02 files changed, 24 insertions(+), 0 deletions(-)
>> =A0create mode 100644 recipes/ruby/files/gcc44.patch
>>
>> diff --git a/recipes/ruby/files/gcc44.patch
>> b/recipes/ruby/files/gcc44.patch
>> new file mode 100644
>> index 0000000..dc5a608
>> --- /dev/null
>> +++ b/recipes/ruby/files/gcc44.patch
>> @@ -0,0 +1,19 @@
>> +---
>> + math.c | =A0 =A02 +-
>> + 1 file changed, 1 insertion(+), 1 deletion(-)
>> +
>> +--- ruby-1.8.5.orig/math.c
>> ++++ ruby-1.8.5/math.c
>> +@@ -32,11 +32,11 @@ domain_check(x, msg)
>> + =A0 =A0 =A0 =A0 =A0 rb_sys_fail(msg);
>> + =A0 =A0 =A0 }
>> + =A0 =A0 =A0 if (isnan(x)) {
>> + #if defined(EDOM)
>> + =A0 =A0 =A0 =A0 =A0 errno =3D EDOM;
>> +-#elif define(ERANGE)
>> ++#elif defined(ERANGE)
>> + =A0 =A0 =A0 =A0 =A0 errno =3D ERANGE;
>> + #endif
>> + =A0 =A0 =A0 =A0 =A0 continue;
>> + =A0 =A0 =A0 }
>> + =A0 =A0 =A0 break;
>> diff --git a/recipes/ruby/ruby-native_1.8.5.bb
>> b/recipes/ruby/ruby-native_1.8.5.bb
>> index e4d2a33..f35363d 100644
>> --- a/recipes/ruby/ruby-native_1.8.5.bb
>> +++ b/recipes/ruby/ruby-native_1.8.5.bb
>> @@ -1,2 +1,7 @@
>> =A0require ruby.inc
>> =A0inherit native
>> +
>> +PR =3D "r1"
>> +
>> +SRC_URI +=3D " file://gcc44.patch;patch=3D1 "
>> +
>
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel
>


