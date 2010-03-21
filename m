Received: from mail-yw0-f197.google.com ([209.85.211.197])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <fransmeulenbroeks@gmail.com>) id 1NtR1N-0004oi-NB
	for openembedded-devel@lists.openembedded.org;
	Sun, 21 Mar 2010 20:41:22 +0100
Received: by ywh35 with SMTP id 35so79044ywh.24
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 21 Mar 2010 12:38:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:received:in-reply-to:references
	:date:message-id:subject:from:to:content-type;
	bh=TBpnsP1A1zKhENFzlON8Kd0tqDdBj5zSvaTtMW0wUSc=;
	b=h0ocu0+eaook/18Km7vN8S+kqn9HL/yGGoJ829lgdFHa/IUyGQYhoYJ1LWwflNfPlM
	3YSW7lVyyF53wve1X/CpWEoF9I7+1fKfJN9py7A7MeHFsQpdyjJ6gGL/bcy83HgFyIey
	kXfFGf8MOXTN1scX/jyt6rSl6ZxQb6DW8Jsck=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type;
	b=XYvPuxzWvD646z1zfngAvlgQIyTUt/aiBTKnuSHKtKz+3Tye+OSf4tcobm1vbs8sGp
	ZGOaVBh43QRyq5YpLRR+tHd6gRgx5aVKvwPuqaqhTIoFJQiNm6aEkLDsB4yLqiMWrAfw
	hj+G5qsR6a54W0mxoanU9pIUoebfgCR4BA9nw=
MIME-Version: 1.0
Received: by 10.100.25.9 with SMTP id 9mr7358725any.46.1269200284338; Sun, 21 
	Mar 2010 12:38:04 -0700 (PDT)
In-Reply-To: <ho5b8b$oao$1@dough.gmane.org>
References: <ac9c93b11003210557u1fcbcc21jb0dafb9fa16ccc96@mail.gmail.com>
	<ho5b8b$oao$1@dough.gmane.org>
Date: Sun, 21 Mar 2010 20:38:04 +0100
Message-ID: <ac9c93b11003211238p38d25065p73841962f1ce2789@mail.gmail.com>
From: Frans Meulenbroeks <fransmeulenbroeks@gmail.com>
To: openembedded-devel@lists.openembedded.org, hawkboard@googlegroups.com
X-SA-Exim-Connect-IP: 209.85.211.197
X-SA-Exim-Mail-From: fransmeulenbroeks@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.1 required=5.0 tests=AWL,BAYES_00,SPF_PASS
	autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: hawkboard at 456 Mhz?
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
X-List-Received-Date: Sun, 21 Mar 2010 19:41:22 -0000
Content-Type: text/plain; charset=ISO-8859-1

2010/3/21 Koen Kooi <k.kooi@student.utwente.nl>:
> -----BEGIN PGP SIGNED MESSAGE-----
> Hash: SHA1
>
> On 21-03-10 13:57, Frans Meulenbroeks wrote:
>> Hi,
>>
>> In the openembedded repository I saw the following patch:
>> http://cgit.openembedded.org/cgit.cgi/openembedded/tree/recipes/linux/linux-davinci/da850_omapl138_opp456mhz.patch
>> This seems to suggest that it is possible to run the hawkboard at 456
>> Mhz (and yeah: I know it is out of spec and out of warranty, but for
>> an experiment it would be quite helpful for me).
>> I've build the kernel with openembedded, the patch is applied,
>> CONF_CPU_FREQ is defined, but the control hook in /sys is not there.
>> I've also tried tweaking the file with the settings (ds850.c) but to no avail.
>>
>> Anyone a suggestion on how to get this done?
>
> You need a newer kernel that doesn't rely on the TPS part for cpufreq
> (hawkboard lacks a PMIC, the evm uses the TPS). You can build from the
> ti/staging[1] branch to get such a kernel.
>
> Or wait a week for that branch to get merge, internal testing is finally
> wrapping up.
>
> [1] http://gitorious.org/angstrom/openembedded/commits/ti/staging


Koen,

Thanks alot!
As patience is something that I don't have an overdose of, I decided
not to waste any on this issue.
So I checked out the git and rebuild the kernel. Works like a charm.

For those who want to reproduce this:
Be sure to adapt defconfig (CONFIG_DA8XX_MAX_SPEED_456=y)

I changed the speed setting with cpuspeed, this one is not on the
angstrom feed, so you need to build it yourself too.

(I have assumed that you can rebuild an openembedded kernel, if
not,then probably this is not for you).

Havve fun!
Frans.


