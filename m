Return-Path: <ross@burtonini.com>
Received: from mail-pg1-f180.google.com (mail-pg1-f180.google.com
	[209.85.215.180])
	by mail.openembedded.org (Postfix) with ESMTP id A61B160231
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 18 Mar 2020 12:11:39 +0000 (UTC)
Received: by mail-pg1-f180.google.com with SMTP id b22so7580832pgb.6
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 18 Mar 2020 05:11:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=burtonini-com.20150623.gappssmtp.com; s=20150623;
	h=subject:to:cc:references:from:message-id:date:user-agent
	:mime-version:in-reply-to:content-language:content-transfer-encoding;
	bh=iX08cla6Dj8fPj5SOwm/f+58eTjGMKn47GesXqlA6eg=;
	b=1dm8DF3gepSJ89OF38VspOMDAfnqbrE/a1utpjw61S0CjvbEVRP+3xHTXVBMKrFNrO
	G0+n1PNujKC9VH7X4O/ugcWNBxBKH5WMJ9sGM8Y7fHWAhdrWs/zJ+yTm4a2rWZKNlJig
	VnHlMdHgc7xWhZwtFOyEtSDOe07heiyjuRBqz5cbNf0fOJZV30urqZ+hxT1WAvRZPIyK
	ni8SxGrqEpSbmkMtU0JNSf1557FCPyt3hGH7m899GljXEVAZc7tR0ba3VOxk10S3/H5F
	I0KJb+y0BMuPwcEwZXxslwNnM/jwcDD2Uf44Do2ZGOgtJ3DdaE0N+qGziIR5mGhdTen9
	vuhg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:subject:to:cc:references:from:message-id:date
	:user-agent:mime-version:in-reply-to:content-language
	:content-transfer-encoding;
	bh=iX08cla6Dj8fPj5SOwm/f+58eTjGMKn47GesXqlA6eg=;
	b=CJFYOgdoe5mJb9gzmSZ75Y90gXJf899pfI7JgacsVGxxLoQl6TsuF23inNk7GhG6i+
	F4y+tUYHmu98gWk/4cLE/bdhA8saGvdsGo11SAtJg8Bo3Fl4PSLRfCLCJg3FHmv92jzY
	6vu5xCwRRMVtj6J6/5yIiaCR/RfQhb/dR5t7b6bOLO2X6dcRGGiOBOwUpeR1qtxsPSNg
	3TkMOpVEvUPh39IsYIa96Hr8auaG18PFW70sjZmUwfezFZolhRAMTBU5OkGHrt5XjrZK
	PTvdKQMhqrnUu4OnCinY9ksWkjz2smI/nHcWWNFeF+Sd+9sn3/nQr+Y+jMM82hOgmL1P
	Z0cA==
X-Gm-Message-State: ANhLgQ3O0f7/iGOvwT8WFrlCInC7vMZY0qW+YgWePf2nAF5jxPoXyV26
	117TGFNDHKqA+qSeN4ZrEElCLJhVWhw=
X-Google-Smtp-Source: ADFU+vveLtGQ1P5sFOFgWeoQW7KyCtxW1VISrgzlKgGMjggC5aUV2CqNmrN1LW/nCQ0Bc5LfywhoSQ==
X-Received: by 2002:a62:1894:: with SMTP id 142mr4169037pfy.27.1584533499786; 
	Wed, 18 Mar 2020 05:11:39 -0700 (PDT)
Received: from placki-mobl1.ger.corp.intel.com ([192.55.54.44])
	by smtp.gmail.com with ESMTPSA id
	w27sm6618774pfq.211.2020.03.18.05.11.37
	(version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
	Wed, 18 Mar 2020 05:11:38 -0700 (PDT)
To: "Robert P. J. Day" <rpjday@crashcourse.ca>
References: <alpine.LFD.2.21.2003171319540.14640@localhost.localdomain>
	<06ab2bbe-0bba-6b5c-1fd8-53ad3db16936@burtonini.com>
	<alpine.LFD.2.21.2003171856500.23572@localhost.localdomain>
	<CAAnfSTu1O59FwuShBXQWTaOW7J4m1Hx5Wa_wCw6yRV-E6XNw8Q@mail.gmail.com>
	<alpine.LFD.2.21.2003180649270.1808135@localhost.localdomain>
From: Ross Burton <ross@burtonini.com>
Message-ID: <eade9e2d-8d47-f394-1aa4-344c054891ab@burtonini.com>
Date: Wed, 18 Mar 2020 12:11:34 +0000
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:68.0)
	Gecko/20100101 Thunderbird/68.6.0
MIME-Version: 1.0
In-Reply-To: <alpine.LFD.2.21.2003180649270.1808135@localhost.localdomain>
Cc: openembedded-devel@lists.openembedded.org
Subject: Re: should indent recipe use "${prefix}" instead of "/usr"?
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
X-List-Received-Date: Wed, 18 Mar 2020 12:11:39 -0000
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-GB
Content-Transfer-Encoding: 7bit

On 18/03/2020 11:00, Robert P. J. Day wrote:
>    never scared to look silly, but i just did a sample build (randomly
> chose qemuarm64 MACHINE), added:
> 
>    IMAGE_FEATURES += "doc-pkgs"
>    RM_WORK_EXCLUDE = "indent"
> 
> to local.conf, then ran:
> 
>    $ bitbake indent
> 
> to look at everything that was generated as part of the "indent" build
> and how it was packaged, to understand what that:

Much easier way:

$ oe-pkgdata-util list-pkg-files -p indent

>    FILES_${PN}-doc += "/usr/doc/indent/indent.html"
> 
> line is doing in indent_2.2.12.bb, and maybe i'm misreading what was
> produced, but the only documentation content produced and bundled
> into the indent-doc rpm package was:
> 
>    $ rpm -qpl indent-doc-2.2.12-r0.aarch64.rpm
>    /usr
>    /usr/share
>    /usr/share/man
>    /usr/share/man/man1
>    /usr/share/man/man1/indent.1
>    $
> 
> so i'm confused as to that line's purpose ... thoughts?

Historical, maybe.  If that line doesn't serve any purpose, delete it.

Ross

