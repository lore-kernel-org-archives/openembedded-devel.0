Received: from mail-wy0-f175.google.com ([74.125.82.175])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <leon.woestenberg@gmail.com>) id 1PDOvG-0007jc-F5
	for openembedded-devel@lists.openembedded.org;
	Tue, 02 Nov 2010 23:01:43 +0100
Received: by wya21 with SMTP id 21so7349739wya.6
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 02 Nov 2010 15:00:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:received:received:in-reply-to
	:references:date:message-id:subject:from:to:content-type;
	bh=psd47WrmbAiYU/EyQMyBECYbpkrTq50o0jvUj8KkPqY=;
	b=fmFaO/vUJ4+Ntr2v46RNt7+CRDhPCEDDX+w3PME0ZwrUcZXDbgvRKzUbUB+pM0dVJ6
	gugAThxV6z52GR+j170KMS4ODh4/4Mr3l3uHhFvBs2oKY9OM9iPYaN5/YITcTdRhfecZ
	Gwky5d/FX+XlcH4gYcqelyNMTIbjAXMQo4iWM=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type;
	b=fV+7dZiZbErdmWZjxVRDQNmS4tA46IpKFFPHQPynoCIsuO4y5LlXVvT+EpfqO3UkXX
	SvsKbjJEKLQU88flX5K8rgiYWOy+DAM3TEactJy58HQJpoFCT5w27gRBuiWfLoH+Uv9x
	GUMbG3H6wLoLP9+0+utgQ1C57pKduhe77AWdU=
MIME-Version: 1.0
Received: by 10.227.29.204 with SMTP id r12mr17716507wbc.110.1288735252238;
	Tue, 02 Nov 2010 15:00:52 -0700 (PDT)
Received: by 10.227.163.79 with HTTP; Tue, 2 Nov 2010 15:00:52 -0700 (PDT)
In-Reply-To: <4CD06C95.7020903@zenlinux.com>
References: <4CD01D52.5020607@balister.org>
	<1A82C1C5-1657-4642-B4F5-5EFCA799D1DC@dominion.thruhere.net>
	<4CD06C95.7020903@zenlinux.com>
Date: Tue, 2 Nov 2010 23:00:52 +0100
Message-ID: <AANLkTimLCp34tWS7Ft5OA_Dtuv6CAtQSACsignVxQA=0@mail.gmail.com>
From: Leon Woestenberg <leon.woestenberg@gmail.com>
To: openembedded-devel@lists.openembedded.org
X-SA-Exim-Connect-IP: 74.125.82.175
X-SA-Exim-Mail-From: leon.woestenberg@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=AWL,BAYES_00,SPF_PASS
	autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: OpenEmbedded and the Yocto Project
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
X-List-Received-Date: Tue, 02 Nov 2010 22:01:43 -0000
Content-Type: text/plain; charset=ISO-8859-1

Hello,

On Tue, Nov 2, 2010 at 8:55 PM, Scott Garman <sgarman@zenlinux.com> wrote:
> On 11/02/2010 07:42 AM, Koen Kooi wrote:
>>
>> Before we go vote on stuff, I propose to try to work on relatively
>> small focussed projects together to see how our goal and way of
>> working match the yoctoproject ones. Things like tinderbox upgrades,
>> buildbot integration and BSP splitting come to mind. The minutes Leon
>> sent today reflect that a well.
>
Agreed. Creating an OpenEmbedded roadmap with such projects, so that
everybody sees what they can contribute to, would help.

We cannot really assign people (like sometimes a company can) but we
can ask them to do what they like, and make them like what they do
(mostly by being nice, oh, and visiting tropical islands once in a
while).

Typically, we have to spread our work more than a company does. I
think we did good over the last few years by attracting new developers
(despite the still steep learning curve). "But does it blend^Wscale?"

To extend a bit on the points still in my head from OEDEM:

- Tinderbox upgrades (automatically parse the collective build
database to extract useful information).
- Buildbot integration
- recipe tree namespace (BSP, ...) splitting in directories and/or overlays.
- automated tests and result reports on qemu targets
- automated tests and test reports on remote hardware board targets
- make available recipes from OpenEmbedded in Yocto(-OpenEmbedded)
- GCC 4.5.x
- merge Yocto/Poky improvements back to OpenEmbedded (checksum-tracked
progress from Richard's Poky proof-of-concept, cross-prelink)

> I am one of the folks who has been working on the Yocto Project (my work
> email is scott.a.garman@intel.com, IRC nick zenlinuxPDX). One of my primary
> responsibilities to date has been setting up and maintaining our
> Buildbot-based autobuilder.
>
Did you keep notes on how to setup such an autobuilder that you can
share in order to easily scale up this effort?

Regards,
-- 
Leon


