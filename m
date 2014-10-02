Return-Path: <otavio.salvador@gmail.com>
Received: from mail-yh0-f48.google.com (mail-yh0-f48.google.com
	[209.85.213.48])
	by mail.openembedded.org (Postfix) with ESMTP id D784C6017E
	for <openembedded-devel@lists.openembedded.org>;
	Thu,  2 Oct 2014 17:37:46 +0000 (UTC)
Received: by mail-yh0-f48.google.com with SMTP id v1so875077yhn.35
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 02 Oct 2014 10:37:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:sender:in-reply-to:references:date:message-id:subject
	:from:to:cc:content-type;
	bh=4X/Dpn7NJQFNP6GJRKWLWTMWXaSqKoMrch8U0p0SgJU=;
	b=c4ZMYZbH9IDUP8pM7QHIioEzR+HKnBg+k1I09ggkjpfwCkHuRVCQVzY7DqCMmxcNmi
	N0vLm2Z5Zw7Bgcrc8e+8m7x+pKjOjLG+nFyVOPaVKW1LZ7e+2WQfIfiLrL4HsT2SPNcN
	CqmLMnrWubMF5a5iyHsHt+FF7CulrWOlfC8ERHLwgRHl5C7k04Atmt23ooTGaIeXGV1k
	0gbpks55iqydbUxyp0ttDU1xjk1mqyeSj4KKKYoovSpDv5I0fExUuO52TqkRgMDk9H75
	wpTVRhHpGBQyAdhC4SeIcxeeop1qHlBgqjbKXHStn4J+TjNv21ZF3EWPJOVWbdpjqQ8S
	Aaiw==
MIME-Version: 1.0
X-Received: by 10.236.207.69 with SMTP id m45mr594175yho.6.1412271467920; Thu,
	02 Oct 2014 10:37:47 -0700 (PDT)
Sender: otavio.salvador@gmail.com
Received: by 10.170.172.70 with HTTP; Thu, 2 Oct 2014 10:37:47 -0700 (PDT)
In-Reply-To: <20141002062154.GG25706@jama>
References: <1402343170-17707-1-git-send-email-blloyd@familyhonor.net>
	<20141002062154.GG25706@jama>
Date: Thu, 2 Oct 2014 14:37:47 -0300
X-Google-Sender-Auth: jlgeXoSkyKR0ui5_XtWA5bN6Zrk
Message-ID: <CAP9ODKoNT2hwQ+a-ynCbCHXDLnE38XPvcY7=Q5AQtKMwpcEZwA@mail.gmail.com>
From: Otavio Salvador <otavio@ossystems.com.br>
To: Martin Jansa <martin.jansa@gmail.com>
Cc: Brian Lloyd <blloyd@familyhonor.net>,
	OpenEmbedded Devel List <openembedded-devel@lists.openembedded.org>
Subject: Re: [meta-oe][PATCH] Upgrade geode video driver to 2.11.15
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
X-List-Received-Date: Thu, 02 Oct 2014 17:37:55 -0000
Content-Type: text/plain; charset=UTF-8

On Thu, Oct 2, 2014 at 3:21 AM, Martin Jansa <martin.jansa@gmail.com> wrote:
> On Mon, Jun 09, 2014 at 02:46:10PM -0500, Brian Lloyd wrote:
>> From: blloyd <blloyd@familyhonor.net>
>>
>> The latest driver corrected a number of issues and compiles without warnings with just one patch.  The header included by the given patch is already included in the geode master line, so will not be be required after the next geode version release.
>
> xf86-video-geode is broken again, would you mind fixing it to build with
> glibc-2.20?
>
> |                  from /home/jenkins/oe/world/shr-core/tmp-glibc/work/i586-oe-linux/xf86-video-geode/2_2.11.16-r21.0/xf86-video-geode-2.11.16/src/lx_memory.c:26:
> | /home/jenkins/oe/world/shr-core/tmp-glibc/sysroots/qemux86/usr/include/xorg/os.h:579:1: error: expected identifier or '(' before '__extension__'
> |  strndup(const char *str, size_t n);
> |  ^

I am not using it anymore so it'd be great if Brian could handle it.

-- 
Otavio Salvador                             O.S. Systems
http://www.ossystems.com.br        http://code.ossystems.com.br
Mobile: +55 (53) 9981-7854            Mobile: +1 (347) 903-9750

