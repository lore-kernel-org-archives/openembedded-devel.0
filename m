Return-Path: <jaragunde@igalia.com>
Received: from fanzine.igalia.com (fanzine.igalia.com [91.117.99.155])
	by mail.openembedded.org (Postfix) with ESMTP id DBF9F6AC3C
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 30 Oct 2017 11:05:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com;
	s=20170329; 
	h=Content-Transfer-Encoding:Content-Type:In-Reply-To:MIME-Version:Date:Message-ID:From:References:Cc:To:Subject;
	bh=loj2EhgeMvpiT6i90VgtcAGv7OCDm5Usj10+VOzDbx0=; 
	b=bWV2i//rXmDLc4hqvOWo6mDhGjyRekLooMvpE8/A6QHhWjrpwCTND0bmQukpfK5Tf6ugjtia8bnNWUEwG2Kgr5HIaBdDtpZkvjVdaP8wRnCmb66FU/WFsYziIuc37BaZjLG9oFZFv3pTCuOS0OjitwKYfnmlVnioelEkknfPtmEhN/Qk3zm+PuDHqvHRjaPE/mfDVsPnfGgQOvbsGxxw6a1Ga67rX3ppBnR7uEMRRRL8spimMdL32D6X5DPI99OLPN8K27wkZYSjkJvTFPOGWLX/O0Ln4k2Nz0ybFJ3OqM9s/qz5hT+Mgd2Nb201pa/2n6o3ppMqn/iWooO8mbDPOQ==;
Received: from [139.47.23.69] (helo=[192.168.1.153])
	by fanzine.igalia.com with esmtpsa 
	(Cipher TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim)
	id 1e97sn-0003RE-EC; Mon, 30 Oct 2017 12:05:29 +0100
To: Trevor Woerner <twoerner@gmail.com>,
	Raphael Kubo da Costa <raphael.kubo.da.costa@intel.com>
References: <cc8aeb58-0a29-de25-29b2-d6f1620409f9@igalia.com>
	<CAP9ODKq_x-xT_ux1tmcgDBuaUc2ekw36YAjQ66=iR3OBRgebJA@mail.gmail.com>
	<CAHUNapS+dr5Uc4upvd00vve+WubDT0Fgsc16vQmWXh3O1ErcLw@mail.gmail.com>
	<4e71f40e-63cb-0857-f292-ec3a120776c1@igalia.com>
	<5612aa4c-d986-89f7-7667-14898b5f7bfc@igalia.com>
	<878tgbxio5.fsf@rkubodac-desk.ger.corp.intel.com>
	<874lqzxhoc.fsf@rkubodac-desk.ger.corp.intel.com>
	<87efq0wnt0.fsf@rkubodac-desk.ger.corp.intel.com>
	<87shefnm1g.fsf@rkubodac-desk.ger.corp.intel.com>
	<20171020153307.GA6636@linux-uys3>
	<87lgk2nmxg.fsf@rkubodac-desk.ger.corp.intel.com>
	<CAP9ODKqqSJDKNsoPoYR0oFUVynQqpey_jaSjLeEAPxYV3fpNPA@mail.gmail.com>
	<87y3o2m1iy.fsf@rkubodac-desk.ger.corp.intel.com>
	<CAHUNapSQ1otDzx4kRVqpW6GFQdVWVhcZcWuWL4Q8n8qLHPyB5Q@mail.gmail.com>
From: =?UTF-8?Q?Jacobo_Aragunde_P=c3=a9rez?= <jaragunde@igalia.com>
Message-ID: <c608b1cf-231f-f5ab-3e12-061b47922763@igalia.com>
Date: Mon, 30 Oct 2017 12:05:19 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.3.0
MIME-Version: 1.0
In-Reply-To: <CAHUNapSQ1otDzx4kRVqpW6GFQdVWVhcZcWuWL4Q8n8qLHPyB5Q@mail.gmail.com>
Cc: Otavio Salvador <otavio.salvador@ossystems.com.br>,
	OpenEmbedded Devel List <openembedded-devel@lists.openembedded.org>
Subject: Re: [meta-browser] Modern Chromium with GN
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
X-List-Received-Date: Mon, 30 Oct 2017 11:05:31 -0000
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit

On 27/10/17 17:44, Trevor Woerner wrote:
> ...
> I was able to successfully build for the minnow board (x86_64), but
> when I tried building for the 32-bit variant for raspberrypi3 I got:
> 
>     | install: cannot stat 'swiftshader/libEGL.so': No such file or directory
> 
> during the do_install step for chromium itself. Odd, I thought egl
> came from mesa? (but then again I thought OE built its own
> gcc-native... :-S
> 

Raphael added the swiftshader libs in this commit, which explains nicely
what they are for:

https://github.com/rakuco/meta-crosswalk/commit/924103037857e6b9e8348d67381ea09cfbf975e3

I was able to build arm32 images for the Pi3 before this commit. I guess
swiftshader is not built on arm?

Best,
-- 
Jacobo Aragunde
Software Engineer at Igalia

