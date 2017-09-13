Return-Path: <twoerner@gmail.com>
Received: from mail-qt0-f175.google.com (mail-qt0-f175.google.com
	[209.85.216.175])
	by mail.openembedded.org (Postfix) with ESMTP id 3273C719A7
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 13 Sep 2017 04:31:08 +0000 (UTC)
Received: by mail-qt0-f175.google.com with SMTP id b1so20248339qtc.4
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 12 Sep 2017 21:31:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to; 
	bh=ifCSrScSTRHwctfbuDISsyZN7mMVK0Eu6uD9fJagzLw=;
	b=YugBaGwGylHMASEpzEZ22+ptIHlWlYkpcm+g3/OWle8yqjXv7U+681dLLgvhGfInQx
	ZfWFRbbINzwl23lWVUR8Bt/AonosLGE3Le5Pbd8vo97/Hqmk+s6VWBHLPrPFnQ/tcjFi
	QIVMZ/U//xNKapfgXi5DaOOxaOQ/mQ/rUzZ4bfqTlIgs/44R4P2OZJAeywm5HYNQaKcV
	UdhKfq7it6129RQWig82e8+seT6JxXMHu0BjYe3f92/omT+zXDVQ5JA6bYiRQPyoQZis
	Fo1OsOUiUdUlXoE4aY1AXHQsdHqtdzEyiIv4HTESTj29LMD2kyPi03sBK/vImA9LWSOj
	lYHQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to;
	bh=ifCSrScSTRHwctfbuDISsyZN7mMVK0Eu6uD9fJagzLw=;
	b=LKOj9ZS3h4jX9O07sMMWzi5NHE3sgSvXw+V9hdG1syMDm4hqxsiIlJhRciqE0DUUQF
	nvwq9UbGpIcO5aJajObfExcoFQJF8ZWQ5eouoAZPRPkQ95v2UCve+DCBFmP5cP2H+wui
	fe6muH06ThfwioIYTAK2pOZ29rDlQg737VGX4zQXZxvZseRf6D4tZIPwXDliIkxdfS4i
	NbFudi3VNd4sBh6XAY0p/5hL0suc6HSNNyK5/ocoVVStOD0MO1uLIfliH5moj58RUz31
	JW7Aun3ZXnYZTToVuUPNVA/DfP4ugDRPStou4N+TDRrjRMMmXX57ayszUyb1ghb7CTl0
	cPVA==
X-Gm-Message-State: AHPjjUjVy0DLIEEDla0VxtMqF3qpQm+IGSM0TcubZQLUi+wnnjLnGxTB
	3ZMfwjWbpoQvamJOEADOM9BNdXfMDlsFzu2AxzE=
X-Google-Smtp-Source: AOwi7QCJIxR+y6Nl/Hi1pRrYAggn+ZwMgdogC9QZ+ToI5zgR9+bg3yzpetnKDRTMksqQI/8YgTl2wf3wWlS827jJuXo=
X-Received: by 10.200.10.1 with SMTP id b1mr25322698qti.118.1505277070266;
	Tue, 12 Sep 2017 21:31:10 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.140.29.74 with HTTP; Tue, 12 Sep 2017 21:31:09 -0700 (PDT)
In-Reply-To: <CAHUNapS=PyHpv+G03RvmgptLxkhTK5mZLxdw4bN3z82Fo6Kvig@mail.gmail.com>
References: <CALbNGRQWNNvf5kLxcWz7EvUK6CO5VMX43vMrPx28yOzCq5NV8g@mail.gmail.com>
	<CAHiDW_GuabOEPc6rgh-vV+f502A5dYi8wFVYhRzqcZBGYHzz9g@mail.gmail.com>
	<CAHiDW_HFgnLbvd64hR8yE107BLtkWcp3eb=mA8towH73pMbUZQ@mail.gmail.com>
	<CALbNGRQBRFeCuz5R10qhBHQGQ3hn7WO9i1SAZ5fV=4BqGepjrQ@mail.gmail.com>
	<CALbNGRT6v530xCdqLp3CRHKOtBZpg8JqYreOsUhFL5u-eV2O2A@mail.gmail.com>
	<CAP9ODKrwUkwdESj-qKrPjsKMN2=W-ZsYBb_+OYhbvrfgcoht2w@mail.gmail.com>
	<87wp65rnfk.fsf@rkubodac-desk.ger.corp.intel.com>
	<8d04fa9f-3049-45cf-4255-bd0159b84751@gmail.com>
	<87r2wcajh6.fsf@rkubodac-desk.ger.corp.intel.com>
	<CALbNGRS1ywFbSNAoY976cPgJ4STQLqUEqzwq34XGaMH_CYhAaw@mail.gmail.com>
	<20170816160609.GA29490@linux-uys3>
	<CA+chaQdPFsk3yJzCO7e=L+=OW=SP8hdg3kUytdj36daOpwqjww@mail.gmail.com>
	<CALbNGRSMbrpZ+LMdRx1ZGAGbJHM3z8E8fT7oW2cNAE9+Sg-82A@mail.gmail.com>
	<CAHUNapS=PyHpv+G03RvmgptLxkhTK5mZLxdw4bN3z82Fo6Kvig@mail.gmail.com>
From: Trevor Woerner <twoerner@gmail.com>
Date: Tue, 12 Sep 2017 21:31:09 -0700
Message-ID: <CAHUNapTy3Lngxr0d2Gkd_2gFkZDcyYaumrEGTK6S8Aks5czhxw@mail.gmail.com>
To: Raphael Kubo da Costa <raphael.kubo.da.costa@intel.com>, 
	"openembedded-devel@lists.openembedded.org"
	<openembedded-devel@lists.openembedded.org>
Subject: Re: chromium detected as stripped
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
X-List-Received-Date: Wed, 13 Sep 2017 04:31:09 -0000
Content-Type: text/plain; charset="UTF-8"

On Wed, Aug 16, 2017 at 10:00 AM, Trevor Woerner <twoerner@gmail.com> wrote:
> I won't submit anything to meta-browser until I can build and get it
> running on a target (or multiple targets).

I've been playing with this off-and-on for the past while. It looks
really nice! Unfortunately I can't seem to get it to compile. Is there
some secret I'm missing? I'm past all the openssl and gcc6/7 nonsense.
All pre-requisites build fine, the build failure is (and has been for
a while) with chromium itself.

I've been trying to build it off master, but chromium always fails in
breakpad. I won't bore you with the full build log (unless you really
want to see it). My build setup is:

Build Configuration:
BB_VERSION        = "1.35.0"
BUILD_SYS         = "x86_64-linux"
NATIVELSBSTRING   = "opensuse-42.2"
TARGET_SYS        = "x86_64-oe-linux"
MACHINE           = "qemux86-64"
DISTRO            = "nodistro"
DISTRO_VERSION    = "nodistro.0"
TUNE_FEATURES     = "m64 core2"
TARGET_FPU        = ""
meta              = "master:2ebbeb61114e4b847e9164c621ac87b5cf03a299"
meta-oe           = "master:8b991640f19f1d19b17db141c31bc56e26695a23"
meta-crosswalk    = "chromium60:433371f15be4a16e1faab9e155d56edb572737d6"

