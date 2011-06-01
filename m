Received: from mail-pw0-f47.google.com ([209.85.160.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <raj.khem@gmail.com>) id 1QRbDG-0003oH-Jb
	for openembedded-devel@lists.openembedded.org;
	Wed, 01 Jun 2011 04:33:56 +0200
Received: by pwj9 with SMTP id 9so2487753pwj.6
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 31 May 2011 19:27:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:message-id:date:from:reply-to:user-agent
	:mime-version:to:subject:references:in-reply-to:content-type
	:content-transfer-encoding;
	bh=NjQ27WN0bWVeF5HZ8IVSysRTl1+vpEj/zM0GBc3cpLw=;
	b=yFRuCOMxc8VhauIy2SNHX6QoinPLz4rtLw4b3jhldMaO87R/zwHWhWEYMBsyJi3WIh
	OSekXYRYz7QHHkWlF3aCqMUQYNxwPVJIhTOt0pjeVcKoxyFbyDHR+WuSPR9KiGQmYHKn
	sKLEkXaT0dfvqPVnJPlmFQQfwlzC13Yah4gpQ=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=message-id:date:from:reply-to:user-agent:mime-version:to:subject
	:references:in-reply-to:content-type:content-transfer-encoding;
	b=FXWxOKmZKos+XpaS1X8XJ7dJ2N5ksDNY6gGzOT6usP1y+IuLKxZ+hELWqu8Cg3mFZM
	uUzPkJQuIgCup/VomIqZ4x1nQzm9HN7v0s2i2Tue69FlzlGtz+dARYe7TLvM8YvlOIto
	X/iL74jH3Kl74VuUNg40sEgWDBkSKqdxIN2+I=
Received: by 10.142.13.16 with SMTP id 16mr1061646wfm.272.1306895268739;
	Tue, 31 May 2011 19:27:48 -0700 (PDT)
Received: from [192.168.1.70] (99-57-141-118.lightspeed.sntcca.sbcglobal.net
	[99.57.141.118])
	by mx.google.com with ESMTPS id q13sm365169wfd.11.2011.05.31.19.27.46
	(version=SSLv3 cipher=OTHER); Tue, 31 May 2011 19:27:47 -0700 (PDT)
Message-ID: <4DE5A3A0.1070508@gmail.com>
Date: Tue, 31 May 2011 19:27:44 -0700
From: Khem Raj <raj.khem@gmail.com>
User-Agent: Mozilla/5.0 (X11; U; Linux i686; en-US;
	rv:1.9.2.17) Gecko/20110424 Lightning/1.0b2 Thunderbird/3.1.10
MIME-Version: 1.0
To: openembedded-devel@lists.openembedded.org
References: <20110531114917.33186l97l89fv3oc@webmail.htc-linux.org>	<20110531115612.15355h3xwavjtjyo@webmail.htc-linux.org>
	<20110531232513.19296umd0ei7gu0w@webmail.htc-linux.org>
In-Reply-To: <20110531232513.19296umd0ei7gu0w@webmail.htc-linux.org>
Subject: Re: oebb.sh oe-core with non-angstrom distro
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
X-List-Received-Date: Wed, 01 Jun 2011 02:33:56 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 8bit

On 05/31/2011 03:25 PM, Lukas-David Gorris wrote:
> Quoting Lukas-David Gorris <lukas@htc-linux.org>:
>
>> Quoting Lukas-David Gorris <lukas@htc-linux.org>:
>>
>>> Hi,
>>>
>>> Is it possible to use the
>>> http://git.angstrom-distribution.org/cgi-bin/cgit.cgi/setup-scripts/
>>> setup scripts for a non-angstrom distro?
>>>
>>> I tried to do this as explained in the following:
>>>
>>> git clone git://git.angstrom-distribution.org/setup-scripts
>>> cd setup-scripts
>>> git checkout -b oe-core remotes/origin/oe-core
>>>
>>> Now I replace ¨angstrom...¨ with ¨shr¨ in DISTRO= in oebb.sh and run
>>>
>>> ./oebb.sh config htcleo #I added htcleo machine in the
>>> meta-smartphone layer
>>>
>>> ./oebb.sh bitbake shr-image
>>>
>>> This will end up with bitbake trying to use some angstrom scripts and
>>> then fail. It would be very nice to make the distro configurable in
>>> oebb.sh. I suppose extra configurations for the non-angstrom distro
>>> will be needed but I am uncertain how to go about this. Maybe we can
>>> add a new branch for SHR specific oebb.sh ?
>>>
>>> Best regards
>>>
>>> Lukas
>>>
>>>
>>
>> Thanks to Heiner I just found the first problem.The meta-shr layer
>> that provides everything specific to the shr distro must be included
>> for this to work.
>>
>
> Patch for git://git.angstrom-distribution.org/setup-scripts,oe-core for
> use with SHR distro:
>
>
> diff --git a/conf/local.conf b/conf/local.conf
> index a641121..69ac50e 100644
> --- a/conf/local.conf
> +++ b/conf/local.conf
> @@ -19,7 +19,7 @@ IMAGE_FSTYPES += "tar.bz2"
> PARALLEL_MAKE = "-j2"
> BB_NUMBER_THREADS = "2"
>
> -DISTRO = "angstrom-2010.x"
> +DISTRO = "shr"
>
> # Set terminal types by default it expects gnome-terminal
> # but we chose xterm
> diff --git a/oebb.sh b/oebb.sh
> index 43697ab..49afaa8 100755
> --- a/oebb.sh
> +++ b/oebb.sh
> @@ -66,7 +66,7 @@ else
> #--------------------------------------------------------------------------
> # Specify distribution information
> #--------------------------------------------------------------------------
> - DISTRO="angstrom-2010.x"
> + DISTRO="shr"
> DISTRO_DIRNAME=`echo $DISTRO | sed s#[.-]#_#g`
>
> echo "export SCRIPTS_BASE_VERSION=${BASE_VERSION}" > ${OE_ENV_FILE}
> @@ -253,7 +253,6 @@ BBFILES = ""
> # Add your overlay location to BBLAYERS
> # Make sure to have a conf/layers.conf in there
> BBLAYERS = " \\
> - \${TOPDIR}/sources/meta-angstrom \\
> \${TOPDIR}/sources/meta-openembedded/meta-oe \\
> \${TOPDIR}/sources/meta-openembedded/meta-efl \\
> \${TOPDIR}/sources/meta-openembedded/meta-gpe \\
> @@ -266,6 +265,8 @@ BBLAYERS = " \\
> \${TOPDIR}/sources/meta-smartphone/meta-openmoko \\
> \${TOPDIR}/sources/meta-smartphone/meta-palm \\
> \${TOPDIR}/sources/meta-smartphone/meta-zaurus \\
> + \${TOPDIR}/sources/meta-smartphone/meta-shr \\
> + \${TOPDIR}/sources/meta-smartphone/meta-fso \\
> \${TOPDIR}/sources/meta-intel/meta-sugarbay \\
> \${TOPDIR}/sources/meta-intel/meta-crownbay \\
> \${TOPDIR}/sources/meta-intel/meta-emenlow \\
> diff --git a/sources/layers.txt b/sources/layers.txt
> index 45c68d2..0d96a70 100644
> --- a/sources/layers.txt
> +++ b/sources/layers.txt
> @@ -1,11 +1,10 @@
> # Name,repo-uri,branch,rev
> bitbake,git://git.openembedded.net/bitbake,master,HEAD
> -meta-angstrom,git://git.angstrom-distribution.org/meta-angstrom,master,HEAD
>
> -meta-openembedded,git://git.openembedded.net/meta-openembedded,master,HEAD
> +meta-openembedded,git://git.openembedded.net/meta-openembedded-contrib,shr,HEAD
>
> meta-texasinstruments,git://git.angstrom-distribution.org/meta-texasinstruments,master,HEAD
>
> meta-efikamx,git://github.com/kraj/meta-efikamx.git,master,HEAD
> meta-nslu2,git://github.com/kraj/meta-nslu2.git,master,HEAD
> meta-smartphone,http://git.shr-project.org/repo/meta-smartphone.git,master,HEAD
>
> meta-intel,git://git.yoctoproject.org/meta-intel,master,HEAD
> meta-xilinx,git://git.yoctoproject.org/meta-xilinx,master,HEAD
> -openembedded-core,https://github.com/openembedded/oe-core.git,master,HEAD
> +openembedded-core,git://git.openembedded.net/openembedded-core-contrib,shr,HEAD
>
>

I guess SHR needs a master projects on similar lines. Using angstrom 
scripts may not be the correct thing to do. Martin might already have 
something. But similar to angstrom scripts there is slugos master 
repository for layer management and configuration.

git://github.com/kraj/slugos-setup.git

I think distro's should have such a repo so they do not have conflict of 
interest and can do things without pinching others toes.

>
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel



