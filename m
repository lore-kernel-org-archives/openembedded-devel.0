Return-Path: <trevor.woerner@linaro.org>
Received: from mail-ee0-f43.google.com (mail-ee0-f43.google.com [74.125.83.43])
	by mail.openembedded.org (Postfix) with ESMTP id 9A9D8610FE
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 23 Sep 2013 22:04:39 +0000 (UTC)
Received: by mail-ee0-f43.google.com with SMTP id e52so2076594eek.16
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 23 Sep 2013 15:04:39 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:date
	:message-id:subject:from:to:cc:content-type;
	bh=yVgXXP8d6yLpGipo081iBhiDA1r0+BBmXh8Yx5xyZYY=;
	b=KkL4Mj1ssID2863gsFaSPjywHeSjlXL91+yHUbd2pqN7F7D+CIVxTazjLtB+YD+iV7
	uIawPIVuhERJG1IvPGgxwDdfUN7xoWKAQQPWf2NQPJx+OKNe3nZKUIx3lXVHa9OD5+b2
	GEjoYxwO2SjkrYTKXTkxM1XizMYAJqbtgZiI2Y/6++7OKPbVtAPIZYDRfyr7zp5BsJRc
	M4rl4s2cXz29NQNyKOVawKqzctheGse9cZB2Z6oVlHs1eN9oHc76wBkEYbQluk56kP9P
	MzTGLgAUiSzB7qzaPnYBVwaR/vLR6FZTBAcwXqohFpedHhkHhPHqTIC779YwzCA6YSmk
	qP3Q==
X-Gm-Message-State: ALoCoQnnH81j0rnIE3y9MDpjzi199CYzVXUcbScZzPe9gwm1+zJq7bniWt8sENk95m9QUy42IuVA
MIME-Version: 1.0
X-Received: by 10.14.246.11 with SMTP id p11mr41003072eer.9.1379973879389;
	Mon, 23 Sep 2013 15:04:39 -0700 (PDT)
Received: by 10.14.117.67 with HTTP; Mon, 23 Sep 2013 15:04:39 -0700 (PDT)
In-Reply-To: <CALmOhgkonsraDVY6TUeE77XscRisOmJkQhw0i3Ymk_aA3pBFbA@mail.gmail.com>
References: <1379910576-24363-1-git-send-email-trevor.woerner@linaro.org>
	<20130923080651.GB3631@jama>
	<CALmOhgkonsraDVY6TUeE77XscRisOmJkQhw0i3Ymk_aA3pBFbA@mail.gmail.com>
Date: Mon, 23 Sep 2013 18:04:39 -0400
Message-ID: <CALmOhg=kyH63jn+pi=apo+frUwH8pTneHss+Z7MnMMJiLR+NUg@mail.gmail.com>
From: Trevor Woerner <trevor.woerner@linaro.org>
To: Martin Jansa <martin.jansa@gmail.com>
Cc: openembedded-devel@lists.openembedded.org
Subject: Re: [meta-qt5][dylan][PATCH] qtwebkit 5.0.2: fix QA issue (bad RPATH)
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
X-List-Received-Date: Mon, 23 Sep 2013 22:04:40 -0000
Content-Type: text/plain; charset=ISO-8859-1

Hi Martin,

On 23 September 2013 10:38, Trevor Woerner <trevor.woerner@linaro.org> wrote:
> On 23 September 2013 04:06, Martin Jansa <martin.jansa@gmail.com> wrote:
>> On Mon, Sep 23, 2013 at 12:29:36AM -0400, Trevor Woerner wrote:
>>> Building qtwebkit would cause a QA issue (which, in my distro, would cause a
>>> build error) such that QtWebPluginProcess and QtWebProcess would contain bad
>>> RPATHs which pointed into the build location. This fix adds a patch to not
>>> include the rpath.prf which leads to this problem.
>>
>> Could you send patch for master/dora first and then backport it to
>> dylan? Otherwise I'll do it, but it will take a bit more time.
>
> As far as I can tell, qtwebkit on master doesn't even try to compile.
> This is what I get in my log.do_compile:

Okay, I see my mistake now, qtbase needs ICU enabled otherwise
qtwebkit won't try to build.

The odd thing is that we get nothing out of qtwebkit, and yet its
build succeeds. This is quite misleading. It would be better:

- if qtwebkit won't build because qtbase doesn't include ICU support
at least a warning would be displayed
- if qtwebkit is part of a image, qtbase would automatically be built
with ICU support

Sadly now that I have enabled ICU in qtbase, my build of qtwebkit on
meta-qt5 master branch is failing. I'll have to look into it some
more. Is anyone else seeing this?

Best regards,
    Trevor

