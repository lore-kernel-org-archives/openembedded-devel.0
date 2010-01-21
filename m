Received: from mail-bw0-f217.google.com ([209.85.218.217])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <d.vinokuroff@gmail.com>) id 1NXtLN-0000k8-5g
	for openembedded-devel@lists.openembedded.org;
	Thu, 21 Jan 2010 10:28:52 +0100
Received: by bwz9 with SMTP id 9so4801687bwz.12
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 21 Jan 2010 01:26:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:received:received:message-id:date:from
	:user-agent:mime-version:to:subject:references:in-reply-to
	:content-type:content-transfer-encoding;
	bh=n3Vs0c4kFQTqyp8aRkj8GARer6mDtgUVW8X0Xsk/RmY=;
	b=po1SpSiNjf6Xo4jgv7yWcwN8fpAIpxmW/2W1geXe/SzBWDh02xejNBLIDDKwY1U7h/
	okrbVr7Yo/sv/fZ7+N6O3Q010OkyyO7+jdz6Ch89FpDLSRLHxnXh2q668wlFoGR/j/W0
	eEXNNJgHX/FI+yapTfeQXHJ0oHv+f82OOQvEo=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=message-id:date:from:user-agent:mime-version:to:subject:references
	:in-reply-to:content-type:content-transfer-encoding;
	b=JG2/dXTR5rUa/8Cz+TAf+rXSWsegNFAeROg9f0LSzBqEb/vdB3wZCki25ksnXibhj5
	Bqh4TkHERO0dgAtVdmLCzARNvYOZ/XA786flW3AvdA2w8XZniBlAP5ar6+KrgnhPvtGl
	RdWdLRnEKT+eNsr63nQGNxkeRMwNd2/bASV1E=
Received: by 10.204.9.151 with SMTP id l23mr613946bkl.76.1264065989991;
	Thu, 21 Jan 2010 01:26:29 -0800 (PST)
Received: from ?192.168.0.100? ([92.255.149.140])
	by mx.google.com with ESMTPS id 14sm345570bwz.9.2010.01.21.01.26.28
	(version=TLSv1/SSLv3 cipher=RC4-MD5);
	Thu, 21 Jan 2010 01:26:29 -0800 (PST)
Message-ID: <4B581DC1.9000902@gmail.com>
Date: Thu, 21 Jan 2010 14:26:25 +0500
From: Dmitry Vinokurov <d.vinokuroff@gmail.com>
User-Agent: Mozilla/5.0 (X11; U; Linux x86_64; en-US;
	rv:1.9.1.8pre) Gecko/20100104 Shredder/3.0.1pre
MIME-Version: 1.0
To: openembedded-devel@lists.openembedded.org
References: <4B5808EE.9010909@gmail.com>
In-Reply-To: <4B5808EE.9010909@gmail.com>
X-SA-Exim-Connect-IP: 209.85.218.217
X-SA-Exim-Mail-From: d.vinokuroff@gmail.com
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: No (on linuxtogo.org); Unknown failure
Subject: Re: Serial console problem: Id "S0" respawning too fast
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
X-List-Received-Date: Thu, 21 Jan 2010 09:28:52 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

Looked at SERIAL_CONSOLE variable values in different machine conf 
files, added '-L' option to getty string in inittab:
S0:2345:respawn:/sbin/getty -L 115200 ttyS0

Now login and shell works fine.

On 21.01.2010 12:57 Dmitry Vinokurov wrote:
> Hello,
>
> I want to set up board only with serial console interface (no tty0).
>
> Kernel bootargs: console=ttyS0,115200n81 root=/dev/nfs rw 
> nfsroot=192.168.0.100:/srv/nfs/armrfs ip=dhcp init=/sbin/init
>
> Inittab has only one getty line: S0:2345:respawn:/sbin/getty 115200 ttyS0
>
> I can see boot log, but it is really hard to login. And even if I 
> could login, it's impossible to execute any commands, shell dies and 
> login message appear again. Here is log of what usually happen:
> ------------------------------------------------
> OpenEmbedded Linux phy3250 ttyS0
>
> minimal .dev-snapshot-20100119 phy3250 ttyS0
>
> phy3250 login: root
> O
> O
> O
> OpenEmbedded Linux phy3250 ttyS0
>
> minimal .dev-snapshot-20100119 phy3250 ttyS0
>
> phy3250 login: r
> OpenEmbedded Linux phy3250 ttyS0
>
> minimal .dev-snapshot-20100119 phy3250 ttyS0
>
> phy3250 login: root
> O
> O
> INIT: Id "S0" respawning too fast: dis
> INIT: no more processes left in this r
>
> O
> O
> O
> O
> O
> O
> O
> O
> O
> INIT: Id "S0" respawning too fast: dis
>
> O
> O
> O
> O
> O
> O
> O
> O
> O
> INIT: Id "S0" respawning too fast: dis
> ------------------------------------------------
>
> Tried to decrease baudrate to 38400 -- same trouble. Really don't know 
> what to do with it. Maybe I miss some kernel or getty options or 
> something else?
>

-- 
Best Regards,
Dmitry Vinokurov
<d.vinokuroff@gmail.com>



