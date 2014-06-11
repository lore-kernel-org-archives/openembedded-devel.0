Return-Path: <eduardo@monkey.io>
Received: from mail-wi0-f169.google.com (mail-wi0-f169.google.com
	[209.85.212.169])
	by mail.openembedded.org (Postfix) with ESMTP id 12A2165E58
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 11 Jun 2014 17:47:43 +0000 (UTC)
Received: by mail-wi0-f169.google.com with SMTP id hi2so5897520wib.2
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 11 Jun 2014 10:47:44 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:date
	:message-id:subject:from:to:cc:content-type;
	bh=mQB/uLq59WmzVWGT+nVET1+2RqvfgJ0xvZv64dhXbdY=;
	b=cuz9LbjkFv0jsvLwU8jyd+sjeUMud6G5sHKtnu+vesXxwktEurMW18JwKQEbJ8PTZx
	mff7//e8eB82YTc2Bk3hZKDkOD80TaGHk/HIPV8lrPLu37G8zodDgobFUIz3WgLzQddY
	gl8hG1Y/JU+KtMZTXHcV801UVwpRe3ub717BSsQo0Wj+oDf+qbRNx387qfbkzc0j4c4L
	uTfi5VYDB2OSuh0y3Oz82Vf4CgA4QjgLtoqNOk9b4Uh6OblGbH4diNe7I+OgLxdT/Xhh
	q6JNwnjMyWING4I6NC02cf0HW9eWJuKeGpl53kQj7tTffurjS6Zn9SYK3RzYb5ZCMbRd
	g6SA==
X-Gm-Message-State: ALoCoQlQ/OJrGxe8yy29QA9r6TJsEaj8G9V7vUABtsqnc9wrh0GhI2+OFxZgHuIljXiOVWQkY0FI
MIME-Version: 1.0
X-Received: by 10.194.57.225 with SMTP id l1mr54530486wjq.25.1402508864263;
	Wed, 11 Jun 2014 10:47:44 -0700 (PDT)
Received: by 10.194.88.135 with HTTP; Wed, 11 Jun 2014 10:47:44 -0700 (PDT)
X-Originating-IP: [148.87.19.222]
In-Reply-To: <1767793.gX9fSKelVL@peggleto-mobl5.ger.corp.intel.com>
References: <1401987607-32495-1-git-send-email-eduardo@monkey.io>
	<5397D858.8020408@windriver.com>
	<1767793.gX9fSKelVL@peggleto-mobl5.ger.corp.intel.com>
Date: Wed, 11 Jun 2014 11:47:44 -0600
Message-ID: <CAEaCVQjL3uhWV_sdu0ec=sEC-QLAKKwkt1m=Wh5G5Z42wWYomg@mail.gmail.com>
From: Eduardo Silva <eduardo@monkey.io>
To: Paul Eggleton <paul.eggleton@linux.intel.com>
X-Content-Filtered-By: Mailman/MimeDel 2.1.12
Cc: openembedded-devel <openembedded-devel@lists.openembedded.org>
Subject: Re: [PATCH] [meta-webserver]: add Monkey HTTP Server.
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
Reply-To: openembedded-devel@lists.openembedded.org
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-devel/>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Wed, 11 Jun 2014 17:47:46 -0000
Content-Type: text/plain; charset=UTF-8

Hi all,

/media/large/tmp/work/core2-64-poky-linux/monkey/1.5.0-
> r0/temp/log.do_compile.22474)
> ERROR: Task 6 (/home/paul/poky/meta-oe/meta-webserver/recipes-
> httpd/monkey/monkey_1.5.0.bb, do_compile) failed with exit code '1'
> ----------------- snip ------------------
>
> The quick fix for this is to inherit autotools-brokensep; a more desirable
> long-term fix would be to fix monkey to allow building it in a separate
> build
> directory.
>
> Eduardo, could you please send patches for these?
>

thanks for tracking down this problem.

After verify, our configure script miss that feature (i am wondering why
this problem did not happened on our local tests), as this is something
that is breaking the build we will work in a long-term fix. You should
receive today a patch for the quickfix plus the new recipe for Monkey
v1.5.1 (minor release).

cheers,

