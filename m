Return-Path: <net147@gmail.com>
Received: from mail-pd0-f182.google.com (mail-pd0-f182.google.com
	[209.85.192.182])
	by mail.openembedded.org (Postfix) with ESMTP id D9C257162E
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 13 Jan 2015 22:57:50 +0000 (UTC)
Received: by mail-pd0-f182.google.com with SMTP id p10so5918695pdj.13
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 13 Jan 2015 14:57:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=message-id:date:from:user-agent:mime-version:to:subject:references
	:in-reply-to:content-type:content-transfer-encoding;
	bh=wGwRJSmYVsuyX527CGYCihE8KKWP9SLTZkda3PfbZj4=;
	b=TvF+C4Xj0VAO0+uVILxtzOjLfPOLNA8Ogt7WUMdn5tT/zOfc3l2ytvrJeT9x72Ixck
	ChwOlaI4KMZjHfLyIVryYtJ6hbQrVUb3gqU+KOHYgy5HPoE8uUzPolUMh9fQvWJqYikw
	JeMnhlojJRiqakLM5PYAvWdhjqJxs6GfthrU9BDaIxMGchU2tfUIQ9y64TbfCY3SfYUm
	6Hwui7Cm+Ln5RKIKstfebIyBu7HkSUaWy+xEyPdLpWkPFQz0TYgSIvKSE29Brqf8inaf
	ec84WmQ5rCeVdjQEmSggrWh45UpKT80Lb4rrF9fUjmdJG8O45dHVV+yRVfrv6OAlooaZ
	eq+g==
X-Received: by 10.66.66.196 with SMTP id h4mr770647pat.127.1421189870976;
	Tue, 13 Jan 2015 14:57:50 -0800 (PST)
Received: from [192.168.0.2] (60-242-179-244.static.tpgi.com.au.
	[60.242.179.244]) by mx.google.com with ESMTPSA id
	q10sm17962617pdm.78.2015.01.13.14.57.48
	for <openembedded-devel@lists.openembedded.org>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Tue, 13 Jan 2015 14:57:50 -0800 (PST)
Message-ID: <54B5A2E8.5090401@gmail.com>
Date: Wed, 14 Jan 2015 09:57:44 +1100
From: Jonathan Liu <net147@gmail.com>
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64;
	rv:31.0) Gecko/20100101 Thunderbird/31.3.0
MIME-Version: 1.0
To: openembedded-devel@lists.openembedded.org
References: <CAHPquwNE8dJtcQ1yM0BuXKG5ug3B89FjZV7z2uxZTp_hFkM=EA@mail.gmail.com>
In-Reply-To: <CAHPquwNE8dJtcQ1yM0BuXKG5ug3B89FjZV7z2uxZTp_hFkM=EA@mail.gmail.com>
Subject: Re: [meta-qt5] What is the proper way to enable OpenGL ES v2 without using .bbappend
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
X-List-Received-Date: Tue, 13 Jan 2015 22:57:59 -0000
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: 7bit

Hi Petr,

On 14/01/2015 8:48 AM, Petr Nechaev wrote:
>   what is the proper way to tell meta-qt5 to build with OpenGL ES v2 support
> without using a .bbappend file like this:
> ----------------------
> # switch to GLES 2 support
> PACKAGECONFIG_GL = "${@base_contains('DISTRO_FEATURES', 'opengl', 'gles2',
> '', d)}"
> ----------------------
You can specify it in distro config, machine config or local.conf:
PACKAGECONFIG_GL_pn-qtbase = "${@base_contains('DISTRO_FEATURES', 
'opengl', 'gles2', '', d)}"

I am not sure what is the proper or standard way though.

Regards,
Jonathan

