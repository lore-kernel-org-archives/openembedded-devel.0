Received: from mail-bk0-f47.google.com ([209.85.214.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martiert@gmail.com>) id 1TRf8Q-0006i9-6T
	for openembedded-devel@lists.openembedded.org;
	Fri, 26 Oct 2012 10:19:18 +0200
Received: by mail-bk0-f47.google.com with SMTP id jk7so967479bkc.6
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 26 Oct 2012 01:05:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=message-id:date:from:user-agent:mime-version:to:subject:references
	:in-reply-to:content-type;
	bh=4zIPm2muEViCsWJWrrWiAO6Q9DmDoaDcNpjt+kZoNLI=;
	b=xt7Yza25PImAJgYdr8TA7AdpBnQcSiAu1obWNE5hde0WssqohV9qehtTniKSrvnEHF
	x25AsHg/U5uK10sRHQGEgyf305QZoEzgWulik5r3XupnkPn44P2CBBCnPwOu7MyuCMdL
	XLlei0v+HfHcvaZnFJqoP1Gm2/04kpevSsUN8GYEgKEtBtdxiZVQQar/vcmmZxvHLSKa
	UZapn2sd+GzWGOv32cff/KN/YbBHZTNh6mr/z+f1XqxdQ2MEzTit1LMTtnO03WNjhB8e
	95YIc7b8kNvwPsHS1dYqIuMOFCLhAknyfjCo1mSHQzv4wgC/G8PLGNSWGJ5Mqa2Waa92
	x1Rw==
Received: by 10.204.9.4 with SMTP id j4mr6792912bkj.22.1351238748532;
	Fri, 26 Oct 2012 01:05:48 -0700 (PDT)
Received: from [10.54.74.11] (64-103-25-233.cisco.com. [64.103.25.233])
	by mx.google.com with ESMTPS id g8sm245735bkv.6.2012.10.26.01.05.46
	(version=SSLv3 cipher=OTHER); Fri, 26 Oct 2012 01:05:47 -0700 (PDT)
Message-ID: <508A426B.8000102@gmail.com>
Date: Fri, 26 Oct 2012 09:57:31 +0200
From: =?ISO-8859-1?Q?Martin_Erts=E5s?= <martiert@gmail.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:10.0.9) Gecko/20121025 Thunderbird/10.0.9
MIME-Version: 1.0
To: openembedded-devel@lists.openembedded.org
References: <1351191528-13408-1-git-send-email-martiert@gmail.com>
	<k6dd8v$tj0$1@ger.gmane.org> <20121026080125.GU3269@jama.jama.net>
In-Reply-To: <20121026080125.GU3269@jama.jama.net>
X-Content-Filtered-By: Mailman/MimeDel 2.1.11
Subject: Re: [meta-systemd][PATCH] meta-systemd: ntp: Change version to what is used in meta-networking.
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
X-List-Received-Date: Fri, 26 Oct 2012 08:19:18 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit

On 10/26/12 10:01, Martin Jansa wrote:
> On Fri, Oct 26, 2012 at 09:14:43AM +0200, Koen Kooi wrote:
>> -----BEGIN PGP SIGNED MESSAGE-----
>> Hash: SHA1
>>
>> Op 25-10-12 20:58, Martin Ertsaas schreef:
>>> Change version of ntp to match that in meta-networking. Also change
>>> ntpdate to ntp-date to match the names used in meta-networking.
>> While you are there, can you also disable the autoactivating for the unit?
>> It's broken and I'm gettig tired of doing 'systemctl disable' on it for
>> every system.
> Cannot we fix it? Last time I've noticed it was using wrong binary (not
> installed by ntpdate package) from .service file.
>
> SHR root@qemux86-64 ~ $ opkg files ntpdate
> Package ntpdate (4.2.6p3-r7) is installed on root and has the following
> files:
> /etc/network/if-up.d/ntpdate
> /usr/bin/ntpdate
> SHR root@qemux86-64 ~ $ grep Exec /lib/systemd/system/ntpdate.service
> ExecStart=/usr/bin/ntpd -q -g -x
>
> Cheers,
>
>
>
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel

So what is happening is that if you just install ntpdate, it still tries
to use ntpd, which doesn't exist? Sorry for the questions now, but I
don't have anywhere to test this right now.

