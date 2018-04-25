Return-Path: <akuster808@gmail.com>
Received: from mail-pf0-f173.google.com (mail-pf0-f173.google.com
	[209.85.192.173])
	by mail.openembedded.org (Postfix) with ESMTP id B9B28744F4
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 25 Apr 2018 19:29:47 +0000 (UTC)
Received: by mail-pf0-f173.google.com with SMTP id j5so16067200pfh.2
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 25 Apr 2018 12:29:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=subject:to:cc:references:from:openpgp:autocrypt:message-id:date
	:user-agent:mime-version:in-reply-to:content-language;
	bh=dblKCPzjbEq9hco/0Xwi4UTqR9VGs4wnDjXM3quLWuI=;
	b=UU1HqQKLom02JrOvNsqf6EsqJ4xW7tU7aT5T/T8kGvtJj4mZxhS5mBVmZcsKk8qHxp
	NTiSlx99rje138PTMhYeXPpTmSZ2JOgsE+hsIN50IXsXXDNnY+iqfpEAGMzBAgJg5r5j
	rwcHNXaWj2db2k40qNxo3s0DhZyODMbJT9CRK9ZSStRPer3j1HUWerSYHh/j5Y+SKu8A
	8OHJa+Npmjzp1g9DyX9R6WIOnmx8UT8Rth83UvcP7zbsODSHJM7IMWD3A7oJC0DpP4hk
	GmNS9/sAcr4Uisor8aOJoQAfftBMQh4fHYK/DFOjVliSwuoz7yzvOMavhx28o4zb7wgK
	Q8IQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:subject:to:cc:references:from:openpgp:autocrypt
	:message-id:date:user-agent:mime-version:in-reply-to
	:content-language;
	bh=dblKCPzjbEq9hco/0Xwi4UTqR9VGs4wnDjXM3quLWuI=;
	b=Vz6CXglgGvSkSjNjHSu/S1Hx13A0xQdqONGpgWTtpof8n+wtSVTEIeMAYDWLMcoNpE
	muz7bAgcLhQ+rKwe/B0grunbcl37GroKnNPAkqyhLGxMSAPTPIbPLjvhvjri4Za7tcA8
	3YjZFvva4IJg1peQCp/YEittsd8+KuC9Pj1DHlsdbF0QROmr/v9omklLT7S+IqOXX6OM
	fpsppZOEUxshmKWU30yDD/gX3FrKOvCiY6fuGi+YpKBDZ6BiE2w2QFWB9vSR0YIkiTvR
	IsHTdTNsEIA67YUlQx7fB5UkBcDbzibOuTwhcsBsR9H/ntdsIOzdkPLTkcWDNdImvtV0
	PucA==
X-Gm-Message-State: ALQs6tBp8dJB6OpW/5ENkrsgOuC+Vk1P8sW88AWiEWcxywn50VRM67vU
	mkc3sUio9BgKG1/2rHVb1xwjdw==
X-Google-Smtp-Source: AIpwx49emYRpt2cXdFwCPV7tf6k6VrJsZBxOzjV2DGwE4VKJnOuU/unLmr14IPOHeF91poMEA5t9hQ==
X-Received: by 10.99.121.129 with SMTP id u123mr16121034pgc.328.1524684588251; 
	Wed, 25 Apr 2018 12:29:48 -0700 (PDT)
Received: from ?IPv6:2601:202:4000:1184:952a:dcb5:7c5a:56df?
	([2601:202:4000:1184:952a:dcb5:7c5a:56df])
	by smtp.gmail.com with ESMTPSA id
	c186sm31812781pfb.40.2018.04.25.12.29.46
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Wed, 25 Apr 2018 12:29:47 -0700 (PDT)
To: Martin Jansa <martin.jansa@gmail.com>
References: <1524665609-7709-1-git-send-email-akuster808@gmail.com>
	<1524665609-7709-5-git-send-email-akuster808@gmail.com>
	<CA+chaQfKr7LHe5rZD7SOCg7bGgFwJ-hWZTdKma5Ex9DButKsSA@mail.gmail.com>
From: akuster808 <akuster808@gmail.com>
Openpgp: preference=signencrypt
Autocrypt: addr=akuster808@gmail.com; prefer-encrypt=mutual; keydata=
	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
	8CS2NxU=
Message-ID: <9bd553cb-02ec-85ac-d958-8db5345d8b83@gmail.com>
Date: Wed, 25 Apr 2018 12:29:46 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.7.0
MIME-Version: 1.0
In-Reply-To: <CA+chaQfKr7LHe5rZD7SOCg7bGgFwJ-hWZTdKma5Ex9DButKsSA@mail.gmail.com>
X-Content-Filtered-By: Mailman/MimeDel 2.1.12
Cc: openembedded-devel <openembedded-devel@lists.openembedded.org>
Subject: Re: [PATCH 5/6] android-tools: refresh patch
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-devel/>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Wed, 25 Apr 2018 19:29:47 -0000
Content-Language: en-US
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit



On 04/25/2018 07:21 AM, Martin Jansa wrote:
> Is something wrong with https://patchwork.openembedded.org/patch/149993/ ?
no. just missed it. thanks.
- armin
>
> On Wed, Apr 25, 2018 at 4:13 PM, Armin Kuster <akuster808@gmail.com
> <mailto:akuster808@gmail.com>> wrote:
>
>     Applying patch preserve-ownership.patch
>     patching file system/extras/ext4_utils/make_ext4fs_main.c
>     Hunk #1 succeeded at 47 with fuzz 2 (offset -2 lines).
>     Hunk #2 succeeded at 81 (offset -2 lines).
>     Hunk #3 succeeded at 144 (offset -2 lines).
>     patching file system/extras/ext4_utils/make_ext4fs.c
>
>     Now at patch preserve-ownership.patch
>
>     Signed-off-by: Armin Kuster <akuster808@gmail.com
>     <mailto:akuster808@gmail.com>>
>     ---
>      .../android-tools/preserve-ownership.patch           | 20
>     ++++++++++++--------
>      1 file changed, 12 insertions(+), 8 deletions(-)
>
>     diff --git
>     a/meta-oe/recipes-devtools/android-tools/android-tools/preserve-ownership.patch
>     b/meta-oe/recipes-devtools/android-tools/android-tools/preserve-ownership.patch
>     index 85af81f..fc350fb 100644
>     ---
>     a/meta-oe/recipes-devtools/android-tools/android-tools/preserve-ownership.patch
>     +++
>     b/meta-oe/recipes-devtools/android-tools/android-tools/preserve-ownership.patch
>     @@ -9,11 +9,13 @@ Upstream-Status: Inappropriate
>       system/extras/ext4_utils/make_ext4fs_main.c |   10 ++++++++--
>       2 files changed, 14 insertions(+), 2 deletions(-)
>
>     ---- a/system/extras/ext4_utils/make_ext4fs_main.c
>     -+++ b/system/extras/ext4_utils/make_ext4fs_main.c
>     -@@ -49,13 +49,15 @@ extern struct fs_info info;
>     +Index: git/system/extras/ext4_utils/make_ext4fs_main.c
>     +===================================================================
>     +--- git.orig/system/extras/ext4_utils/make_ext4fs_main.c
>     ++++ git/system/extras/ext4_utils/make_ext4fs_main.c
>     +@@ -47,13 +47,15 @@ struct selabel_handle;
>     + extern struct fs_info info;
>
>     - extern struct selabel_handle*
>     selinux_android_file_context_handle(void);
>
>      +extern int preserve_owner;
>      +
>     @@ -28,7 +30,7 @@ Upstream-Status: Inappropriate
>             fprintf(stderr, "    <filename> [<directory>]\n");
>       }
>
>     -@@ -81,7 +83,7 @@ int main(int argc, char **argv)
>     +@@ -79,7 +81,7 @@ int main(int argc, char **argv)
>             struct selinux_opt seopts[] = { { SELABEL_OPT_PATH, "" } };
>       #endif
>
>     @@ -37,7 +39,7 @@ Upstream-Status: Inappropriate
>                     switch (opt) {
>                     case 'l':
>                             info.len = parse_num(optarg);
>     -@@ -144,6 +146,10 @@ int main(int argc, char **argv)
>     +@@ -142,6 +144,10 @@ int main(int argc, char **argv)
>                             }
>       #endif
>                             break;
>     @@ -48,8 +50,10 @@ Upstream-Status: Inappropriate
>                     case 'v':
>                             verbose = 1;
>                             break;
>     ---- a/system/extras/ext4_utils/make_ext4fs.c
>     -+++ b/system/extras/ext4_utils/make_ext4fs.c
>     +Index: git/system/extras/ext4_utils/make_ext4fs.c
>     +===================================================================
>     +--- git.orig/system/extras/ext4_utils/make_ext4fs.c
>     ++++ git/system/extras/ext4_utils/make_ext4fs.c
>      @@ -67,6 +67,8 @@
>
>       #endif
>     -- 
>     2.7.4
>
>     -- 
>     _______________________________________________
>     Openembedded-devel mailing list
>     Openembedded-devel@lists.openembedded.org
>     <mailto:Openembedded-devel@lists.openembedded.org>
>     http://lists.openembedded.org/mailman/listinfo/openembedded-devel
>     <http://lists.openembedded.org/mailman/listinfo/openembedded-devel>
>
>


