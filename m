Received: from mail.geekisp.com ([216.168.135.169] helo=starfish.geekisp.com)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <philip@balister.org>) id 1NYL6t-0002Xz-Tj
	for openembedded-devel@lists.openembedded.org;
	Fri, 22 Jan 2010 16:07:47 +0100
Received: (qmail 11379 invoked by uid 1003); 22 Jan 2010 15:05:24 -0000
Received: from localhost (HELO ?192.168.1.167?) (philip@opensdr.com@127.0.0.1)
	by mail.geekisp.com with SMTP; 22 Jan 2010 15:05:24 -0000
Message-ID: <4B59BEB2.6080805@balister.org>
Date: Fri, 22 Jan 2010 10:05:22 -0500
From: Philip Balister <philip@balister.org>
User-Agent: Mozilla/5.0 (X11; U; Linux x86_64; en-US;
	rv:1.9.1.5) Gecko/20091209 Fedora/3.0-3.fc11 Thunderbird/3.0
MIME-Version: 1.0
To: openembedded-devel@lists.openembedded.org
References: <19c1b8a91001212252u260f854enc50a9cc8f44099b4@mail.gmail.com>
	<1264149016-18488-1-git-send-email-marcin@juszkiewicz.com.pl>
In-Reply-To: <1264149016-18488-1-git-send-email-marcin@juszkiewicz.com.pl>
X-SA-Exim-Connect-IP: 216.168.135.169
X-SA-Exim-Mail-From: philip@balister.org
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
X-List-Received-Date: Fri, 22 Jan 2010 15:07:47 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

On 01/22/2010 03:30 AM, Marcin Juszkiewicz wrote:
> From: Marcin Juszkiewicz<marcin@buglabs.net>
>
> Looks like gcc 4.4.x do not like the way Ruby programmers used
> preprocessor.
>
> This change is not present in .dev due to different versions of Ruby.
>
> Signed-off-by: Marcin Juszkiewicz<marcin@buglabs.net>

Acked-by: Philip Balister <philip@balister.org>


> ---
>   recipes/ruby/files/gcc44.patch    |   19 +++++++++++++++++++
>   recipes/ruby/ruby-native_1.8.5.bb |    5 +++++
>   2 files changed, 24 insertions(+), 0 deletions(-)
>   create mode 100644 recipes/ruby/files/gcc44.patch
>
> diff --git a/recipes/ruby/files/gcc44.patch b/recipes/ruby/files/gcc44.patch
> new file mode 100644
> index 0000000..dc5a608
> --- /dev/null
> +++ b/recipes/ruby/files/gcc44.patch
> @@ -0,0 +1,19 @@
> +---
> + math.c |    2 +-
> + 1 file changed, 1 insertion(+), 1 deletion(-)
> +
> +--- ruby-1.8.5.orig/math.c
> ++++ ruby-1.8.5/math.c
> +@@ -32,11 +32,11 @@ domain_check(x, msg)
> + 	    rb_sys_fail(msg);
> + 	}
> + 	if (isnan(x)) {
> + #if defined(EDOM)
> + 	    errno = EDOM;
> +-#elif define(ERANGE)
> ++#elif defined(ERANGE)
> + 	    errno = ERANGE;
> + #endif
> + 	    continue;
> + 	}
> + 	break;
> diff --git a/recipes/ruby/ruby-native_1.8.5.bb b/recipes/ruby/ruby-native_1.8.5.bb
> index e4d2a33..f35363d 100644
> --- a/recipes/ruby/ruby-native_1.8.5.bb
> +++ b/recipes/ruby/ruby-native_1.8.5.bb
> @@ -1,2 +1,7 @@
>   require ruby.inc
>   inherit native
> +
> +PR = "r1"
> +
> +SRC_URI += " file://gcc44.patch;patch=1 "
> +


