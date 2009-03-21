Received: from [74.125.46.156] (helo=yw-out-1718.google.com)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <kergoth@gmail.com>) id 1LkpfY-0001On-Lw
	for openembedded-devel@lists.openembedded.org;
	Sat, 21 Mar 2009 02:06:37 +0100
Received: by yw-out-1718.google.com with SMTP id 9so894447ywk.42
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 20 Mar 2009 18:05:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:sender:received:in-reply-to
	:references:date:x-google-sender-auth:message-id:subject:from:to:cc
	:content-type:content-transfer-encoding;
	bh=0O4iLypmawog9zQYjFSB24/JQ2/5n8jM6wMIoAbCJeI=;
	b=cr4MW3vo3ZYo96J8RPwstiY1eEIAzYIFVv9gFF1+UTalMW88awiXUYauP9+n4cP3UP
	VIehXjJyVKNAZiGCluQFnRf1RvQ/tnxb2TNW2QAn+y9tpyWnLT2dLS4au8284hUYECrF
	4v3BEU14nr+rWLgHoMw4K79HDD3yHIRS+jkZM=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:sender:in-reply-to:references:date
	:x-google-sender-auth:message-id:subject:from:to:cc:content-type
	:content-transfer-encoding;
	b=w1kGMpKmfNa/MDjHUWrjx8WjYsJ3wOT0VRwfIguei4LYUPLdZPwGHhquKhDxInWk5W
	mek5CgHALoZazU/+ZqGcCJQMy2a2a5Ow6NVwEy6GTXOL3zkHa5Wd/ZBxsWZN7qWXNpQ/
	hf0w+Ds8DdF1OoCxhKh8n6r6iVDR4iG4g/83E=
MIME-Version: 1.0
Sender: kergoth@gmail.com
Received: by 10.150.49.15 with SMTP id w15mr115554ybw.220.1237597530060; Fri, 
	20 Mar 2009 18:05:30 -0700 (PDT)
In-Reply-To: <gpvlao$cps$1@ger.gmane.org>
References: <80a0c20d0903191458m2c450cb3se2ed0c2ef2680c78@mail.gmail.com>
	<gpvlao$cps$1@ger.gmane.org>
Date: Fri, 20 Mar 2009 18:05:30 -0700
X-Google-Sender-Auth: c5bb624b9f06bc2e
Message-ID: <b6ebd0a50903201805l2eb43d3v8c1f88979e0f1db2@mail.gmail.com>
From: Chris Larson <clarson@kergoth.com>
To: openembedded-devel@lists.openembedded.org
Cc: openembedded-devel@openembedded.org
Subject: Re: packaged-staging not working properly
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
X-List-Received-Date: Sat, 21 Mar 2009 01:06:39 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On Fri, Mar 20, 2009 at 1:49 AM, Koen Kooi <k.kooi@student.utwente.nl> wrote:
> On 19-03-09 22:58, Matthieu Poullet wrote:
>>
>> Hi,
>>
>> I'd like to use the packaged-staging capability of OE.
>> I'm building the console-image for the BB using the dev branch.
>
>> DEPLOY_DIR_PSTAGE = "${OE_HOME}/archives"
>
> Here you save *only* the pstage packages
>
>> touch: cannot touch `/home/mpoullet/oe/tmp/deploy/glibc/ipk/Packages':
>> No such file or directory
>
> And here it wants to use something from deploy outside of PSTAGE.

That doesn't make any sense.  Packages should be created when needed
in the image/rootfs creation process.

> This intented behaviour, you need to save the complete DEPLOY_DIR if you
> want packaged-staging to work as you expect.

I've been doing builds saving only the pstage packages repeatedly for
the past week.  I have hit the problem he's hit, but I can't repro it
anymore.  Builds are working fine, even images.
-- 
Chris Larson
clarson at kergoth dot com
clarson at mvista dot com
Founder - BitBake, OpenEmbedded, OpenZaurus
Maintainer - Tslib
Software Engineer
MontaVista Software, Inc.


