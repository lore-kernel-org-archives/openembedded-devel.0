Received: from mail-ww0-f43.google.com ([74.125.82.43])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <tworaz666@gmail.com>) id 1Rx2tD-0003hv-VF
	for openembedded-devel@lists.openembedded.org;
	Mon, 13 Feb 2012 21:52:48 +0100
Received: by wgbdr13 with SMTP id dr13so4707209wgb.24
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 13 Feb 2012 12:44:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=message-id:date:from:user-agent:mime-version:to:cc:subject
	:references:in-reply-to:content-type:content-transfer-encoding;
	bh=cBr6ab151tytzDb8eURfIJIj+V0eypiRO3t2Kevgdj4=;
	b=FVZE99dQew4Vp+35QWs5PwFQuWeN09ZGxuZejSJ4VitwAN4yX238S8SmkQJxMSNm6u
	C+ek3wQZN56dutM04Ty63HVWrE9jEXvqhWvQbLsVI4LiVRuPJVFk+4YEMiUjX6GRLaky
	nqFLIJgTWelXuUo+oYK+mxxSHmPhynpUEA8+4=
Received: by 10.216.136.138 with SMTP id w10mr3599212wei.33.1329165878323;
	Mon, 13 Feb 2012 12:44:38 -0800 (PST)
Received: from [192.168.0.10] (89-77-50-243.dynamic.chello.pl. [89.77.50.243])
	by mx.google.com with ESMTPS id l8sm50138105wiy.5.2012.02.13.12.44.37
	(version=SSLv3 cipher=OTHER); Mon, 13 Feb 2012 12:44:37 -0800 (PST)
Message-ID: <4F3975AF.6090803@gmail.com>
Date: Mon, 13 Feb 2012 21:42:23 +0100
From: Peter Tworek <tworaz666@gmail.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:9.0) Gecko/20120112 Thunderbird/9.0
MIME-Version: 1.0
To: openembedded-devel@lists.openembedded.org
References: <1328919245-27394-1-git-send-email-schnitzeltony@googlemail.com>
	<jh6qk3$vck$1@dough.gmane.org>
	<CALbNGRSpaCQ+0rWxMOrurUVArmmVou6-KsYDSnsPujj+faMVng@mail.gmail.com>
In-Reply-To: <CALbNGRSpaCQ+0rWxMOrurUVArmmVou6-KsYDSnsPujj+faMVng@mail.gmail.com>
Subject: Re: [meta-xfce] xfce4-session: move static libraries to ${PN}-staticdev to avoid QA warnings
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
X-List-Received-Date: Mon, 13 Feb 2012 20:52:48 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 8bit

On 02/12/2012 10:30 PM, Andreas Müller wrote:
> On Sat, Feb 11, 2012 at 11:37 PM, Koen Kooi<koen@dominion.thruhere.net>  wrote:
>> -----BEGIN PGP SIGNED MESSAGE-----
>> Hash: SHA1
>>
>> Op 11-02-12 01:14, Andreas Müller schreef:
>>> Signed-off-by: Andreas Müller<schnitzeltony@googlemail.com>  ---
>>> .../xfce4-session/xfce4-session_4.8.2.bb           |    4 ++--
>> Which of the other patches listed in
>> http://patches.openembedded.org/project/oe/list/?q=meta-xfce should I push
>> as well?
>>
>> regards,
>>
>> Koen
> 20803: [meta-xfce,3/3,v2] xfce4-panel: Remove static version of panel
> plugins: OK but needs a PR Bump. Who takes care?
Done v3 takes care of it. [21213]
> 20697: [meta-xfce,3/3] xfce4-panel: Disable building of static
> libraries: Peter: can you please mark this one as superseded in
> patchwork?
Done.
> 20695: [meta-xfce,2/3] xfce4-settings: Update to latest stable version
> 4.8.3: New recipe starts on PR = "r1". Who takes care?

PR added. [21211]

> 20699: [meta-xfce,1/3] xfconf: Update to latest stable version 4.8.1:
> This can't go in like this. Peter: can you please mark this one as
> superseded or rejected in patchwork?

Marked as rejected.

> 20691: [meta-xfce] xfce4-power-manager: Add initial recipe for version
> 1.0.10: This one can go in.
>
> Andreas
>
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel



