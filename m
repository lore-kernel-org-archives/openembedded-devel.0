Return-Path: <rafael.carre@gmail.com>
Received: from mail-wi0-f175.google.com (mail-wi0-f175.google.com
	[209.85.212.175])
	by mail.openembedded.org (Postfix) with ESMTP id 8E536606BF
	for <openembedded-devel@lists.openembedded.org>;
	Thu,  9 Apr 2015 07:58:15 +0000 (UTC)
Received: by wiaa2 with SMTP id a2so87881579wia.0
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 09 Apr 2015 00:58:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=sender:message-id:date:from:user-agent:mime-version:to:subject
	:references:in-reply-to:content-type:content-transfer-encoding;
	bh=FcLc/rLiWXQs3sLw2ZHZUrQGZt2is7WGS4ZxeQGHplo=;
	b=d5Ke2+p8VgpL7cgRZSLxrHi1XvHzy+ZGpemTE0QiSZnrnp3s5uoEWuJqkaQDHC86Nn
	hrkQcL3UAerJ3Nj6dLZWlFnf6gOIfakU+zLxizXmhMU3gDfi36Jjdaph2FoJ7zdjScz2
	NG/Gimvf4Q7Jgy+epHkZDuKevYEGU7jfBdbwj4qkmZ87WCU+EYZNiPlgPyVtxaHhQwfU
	JhJ4zv+3+qm10y+Gc6G8yeAkZBpf8Tp8ysuI7TZPFfnqxaDUyW2D5ZlUJtl+44DYwJ1y
	w99wv7FknWfK+1uODPD8mtQ6/2D39DGyU09jJoB5Nzl3KfIsu6KmcRkK+NmOtbDOt8qJ
	FaPA==
X-Received: by 10.180.77.199 with SMTP id u7mr3960760wiw.42.1428566296740;
	Thu, 09 Apr 2015 00:58:16 -0700 (PDT)
Received: from [192.168.0.10] (lns-bzn-49f-62-147-165-143.adsl.proxad.net.
	[62.147.165.143])
	by mx.google.com with ESMTPSA id df1sm1231292wib.12.2015.04.09.00.58.14
	for <openembedded-devel@lists.openembedded.org>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Thu, 09 Apr 2015 00:58:15 -0700 (PDT)
Sender: =?UTF-8?B?UmFmYcOrbCBDYXJyw6k=?= <rafael.carre@gmail.com>
Message-ID: <55263114.9010204@videolan.org>
Date: Thu, 09 Apr 2015 09:58:12 +0200
From: =?windows-1252?Q?Rafa=EBl_Carr=E9?= <funman@videolan.org>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:31.0) Gecko/20100101 Thunderbird/31.6.0
MIME-Version: 1.0
To: openembedded-devel@lists.openembedded.org
References: <5525A029.2000804@mlbassoc.com>
In-Reply-To: <5525A029.2000804@mlbassoc.com>
Subject: Re: vlc runtime issues
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
X-List-Received-Date: Thu, 09 Apr 2015 07:58:17 -0000
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit

Hello,

On 04/08/2015 11:39 PM, Gary Thomas wrote:
> Now that I've finally built vlc for my embedded target (i.MX6),
> I've run into some issues.
> 
> First are missing codecs:
> [0xb5c25e78] main decoder error: no suitable decoder module for fourcc `h264'. VLC probably does not support this sound or video format.
> [0xb5c25e78] main decoder error: no suitable decoder module for fourcc `mp4a'. VLC probably does not support this sound or video format.
> 
> Are these something that can be enabled via PACKAGECONFIG?

You should get them by enabling libva in PACKAGECONFIG

> I'm not sure these are important:
> [0xb454e458] lua probe error: Error loading script /usr/lib/vlc/lua/sd/fmc.luac: /usr/lib/vlc/lua/sd/fmc.luac: incompatible precompiled chunk
> [0xb454e458] lua probe error: Error loading script /usr/lib/vlc/lua/sd/icecast.luac: /usr/lib/vlc/lua/sd/icecast.luac: incompatible precompiled chunk
> [0xb454e458] lua probe error: Error loading script /usr/lib/vlc/lua/sd/jamendo.luac: /usr/lib/vlc/lua/sd/jamendo.luac: incompatible precompiled chunk
> [0xb454e458] lua probe error: Error loading script /usr/lib/vlc/lua/sd/metachannels.luac: /usr/lib/vlc/lua/sd/metachannels.luac: incompatible precompiled chunk
> 
> These probably happen because of cross compiling from x86_64 -> ARM/Cortex-A9

Yes, luac doesn't support cross compilation
The .lua files should be installed rather than the .luac

> Any ideas?  I'm mostly keen on getting the codecs I need.  I already
> have them working using mplayer, but I'd like vlc as well.
> 
> Thanks
> 

