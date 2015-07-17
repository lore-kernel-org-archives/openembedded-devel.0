Return-Path: <dominic.sacre@gmx.de>
Received: from mout.gmx.net (mout.gmx.net [212.227.17.21])
	by mail.openembedded.org (Postfix) with ESMTP id F23F465CBC
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 17 Jul 2015 14:46:20 +0000 (UTC)
Received: from [192.168.1.71] ([79.253.180.208]) by mail.gmx.com (mrgmx103)
	with ESMTPSA (Nemesis) id 0LmrZY-1YkKyz2EA8-00h7FA for
	<openembedded-devel@lists.openembedded.org>;
	Fri, 17 Jul 2015 16:46:17 +0200
Message-ID: <55A914F9.2010204@gmx.de>
Date: Fri, 17 Jul 2015 16:45:13 +0200
From: =?UTF-8?B?RG9taW5pYyBTYWNyw6k=?= <dominic.sacre@gmx.de>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:31.0) Gecko/20100101 Thunderbird/31.7.0
MIME-Version: 1.0
To: openembedded-devel@lists.openembedded.org
References: <1437050752-12663-1-git-send-email-dominic.sacre@gmx.de>
	<CAJ86T=XoRKBHyH0HmDv9thHr8qSievRt-WwT=qddsUkuyg5qpA@mail.gmail.com>
In-Reply-To: <CAJ86T=XoRKBHyH0HmDv9thHr8qSievRt-WwT=qddsUkuyg5qpA@mail.gmail.com>
X-Provags-ID: V03:K0:dbxWUUm3oLeu34USDebRMH0qOHZzbPPNticK/b8au7j2OOjps/x
	O09chLkOkqTReeuGOYdvPDyMIeU6fDHnQgsvP2mOHw0s0PlMBkBy9Lk1Wf3kXohLN2mFS51
	OfLivvKNXJ/z1b07Gj2SUCEh8jiY0BjCPI50gHvf91sCrJuMWHOepnQqMSldInxLBnvm9Gm
	h2cwW/dQ+u7Ob8CDb2hbA==
X-UI-Out-Filterresults: notjunk:1;V01:K0:Z/Co9fjKf7w=:ttQ+W+Pj3WmKhn3D2ChLnM
	MBNWiualx7Twe03oPH/nTq0t5Xbbvl0jLLODQvAQVO57J4xUleEg1BAS2wcmLujOyW81NG6G/
	HVHn530/DySwPp0yJYXUz01pr6QVv6iCCk6/owtJsc+F0PqxIPZkfpQsARkobDZjxD4RDJcNF
	t3qlWnMct1qRT9SHIiPUGlpgGYIUg5msx8gn+qd++Ld1PXA5tzJC8nIx7UOzdGj3YOnhGd5X1
	OdgSUm2tlSH8VEoeRsH7AbCmIoc5OH5s7EQ746JstqXSgyOmCwO+DaLrWiMt56JZhcueQCEJa
	ptLhMmdClPAAkiAN0c50+pxF5YE/cQCZGbL0+O9QIlYr4AfxfI6dqTQDYnSs7dj4no0YdhotZ
	no4UzfYE7U/ltkR83Z6bLk34/YRkfBvfwl6Sl/3glhmvonypCPMvMrQ7ruJDHQChfEEuoHgn9
	jt5sQg1rZb9hN8Jk0YXYx0KWBOkVoE4Emhze6hISBydqKPic3oCULxwRILSOfYOpbuKkXz2sa
	Y+iFQp5Pl+jMYdxxYnvmgg/ohc1zLphbQk7KgW0FHI6WUKsLoLDsBrjWFMPVrfb5Hnxb4tPNO
	D8WqnkQ3tp8jnegvGHHYqPmmD8Q8PJ5TjyT9QMDMJuFWwaAt5RMVnt9SEII/kXgzWkaxAaRcD
	pb4je9hihVPKqiJ+KN96lbWC5pNcZ/hHASSiFcoffploxRMbOXCsDGXjOx0rblM+wabg=
Subject: Re: [meta-oe][PATCH] fio: Add PACKAGECONFIG for numa, re-enable ARM build
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
X-List-Received-Date: Fri, 17 Jul 2015 14:46:25 -0000
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit

Hi Andre,

On 2015-07-17 02:46, Andre McCurdy wrote:
>> +PACKAGECONFIG[numa] = ",--disable-numa,numactl"
> 
> I don't think this change will work.
> 
> The fio recipe doesn't use autotools, so the --disable-numa option set
> via PACKAGECONFIG isn't going to have any effect unless you also
> manually pass EXTRA_OECONF into the build somehow.

Ouch, you're right. The configure script is currently only called
indirectly (from the Makefile) and without arguments during do_compile.

How about adding this simple do_configure function?

do_configure() {
    ${B}/configure ${EXTRA_OECONF}
}

>>  # ARM does not currently support NUMA
>> -COMPATIBLE_HOST = "^((?!arm).*)$"
>> +PACKAGECONFIG_remove_arm = "numa"
> 
> In general, it would be better to use something like:
> 
>   PACKAGECONFIG_NUMA = "numa"
>   PACKAGECONFIG_NUMA_arm = ""
> 
>   PACKAGECONFIG ??= "${PACKAGECONFIG_NUMA}"
> 
> _remove can be a little difficult to 'over-ride', so makes things
> harder if someone did, one day, want to experiment with enabling that
> option from local.conf or a .bbappend.

Good point. I thought the _remove was ugly, but it didn't occur to me to
use an additional level of indirection like this.


Dominic

