Received: from mail-iw0-f203.google.com ([209.85.223.203])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <raj.khem@gmail.com>) id 1NYDQE-00058n-VK
	for openembedded-devel@lists.openembedded.org;
	Fri, 22 Jan 2010 07:55:17 +0100
Received: by iwn41 with SMTP id 41so727982iwn.12
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 21 Jan 2010 22:52:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:received:in-reply-to:references
	:date:message-id:subject:from:to:content-type
	:content-transfer-encoding;
	bh=kLlVNHkLE2M8KAQQvo3Dk6xhhW2WSFzqLdYO1C+Lbn0=;
	b=Upw+5fySGCA9cE82zN075fhpN/ZalO5JuP5+okYOUBKGLgD0bHYkjQ65i/WOBjzUSr
	1ZuhuokAlrmWtHXfx83DWv4MX1AmNUz4kSlmVXXIAgUONX6/Vy+KJ1zF/3NoVhagt61Y
	JEzvxaN1Fd8UCkRik+2fNzWrf7WlqrNv10Cps=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type:content-transfer-encoding;
	b=DUanVbsZ/yYPsgxHXJv3w8rEP0N01fYP86NVvdN5wG6GnT7E0VVpsZbCw+l/Dl7lOU
	gyk+YQJn8Jmyq9mX3/ydsmxllN34YFPRa4KrvpFrIw8VWcGHA/LkvD9rEkfel8wapO6u
	lbZM9Rt0exDSUb9XkS3cWReuAUS2wiPqBLhm4=
MIME-Version: 1.0
Received: by 10.231.59.7 with SMTP id j7mr167266ibh.12.1264143173014; Thu, 21 
	Jan 2010 22:52:53 -0800 (PST)
In-Reply-To: <1264142275-17415-1-git-send-email-marcin@juszkiewicz.com.pl>
References: <1264142275-17415-1-git-send-email-marcin@juszkiewicz.com.pl>
Date: Thu, 21 Jan 2010 22:52:52 -0800
Message-ID: <19c1b8a91001212252u260f854enc50a9cc8f44099b4@mail.gmail.com>
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
X-SA-Exim-Connect-IP: 209.85.223.203
X-SA-Exim-Mail-From: raj.khem@gmail.com
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: No (on linuxtogo.org); Unknown failure
Subject: Re: [STABLE][PATCH] ruby-native: fix building with gcc 4.4.x
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
X-List-Received-Date: Fri, 22 Jan 2010 06:55:17 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

On Thu, Jan 21, 2010 at 10:37 PM, Marcin Juszkiewicz
<marcin@juszkiewicz.com.pl> wrote:
> From: Marcin Juszkiewicz <marcin@buglabs.net>
>
> Looks like gcc 4.4.x do not like the way Ruby programmers used
> preprocessor.
>
> This change is not present in .dev due to different versions of Ruby.
>
> Signed-off-by: Marcin Juszkiewicz <marcin@buglabs.net>
> ---
> =A0recipes/ruby/files/gcc44.patch =A0 =A0| =A0 23 +++++++++++++++++++++++
> =A0recipes/ruby/ruby-native_1.8.5.bb | =A0 =A05 +++++
> =A02 files changed, 28 insertions(+), 0 deletions(-)
> =A0create mode 100644 recipes/ruby/files/gcc44.patch
>
> diff --git a/recipes/ruby/files/gcc44.patch b/recipes/ruby/files/gcc44.pa=
tch
> new file mode 100644
> index 0000000..b8f8ee4
> --- /dev/null
> +++ b/recipes/ruby/files/gcc44.patch
> @@ -0,0 +1,23 @@
> +---
> + math.c | =A0 =A04 +++-
> + 1 file changed, 3 insertions(+), 1 deletion(-)
> +
> +--- ruby-1.8.5.orig/math.c
> ++++ ruby-1.8.5/math.c
> +@@ -32,13 +32,15 @@ domain_check(x, msg)
> + =A0 =A0 =A0 =A0 =A0 rb_sys_fail(msg);
> + =A0 =A0 =A0 }
> + =A0 =A0 =A0 if (isnan(x)) {
> + #if defined(EDOM)
> + =A0 =A0 =A0 =A0 =A0 errno =3D EDOM;
> +-#elif define(ERANGE)
             ^^^^^^
this is the problem, it should be '#elif defined' and then it should work.

Thx

-Khem


