Return-Path: <paul.betafive@gmail.com>
Received: from mail-qg0-f44.google.com (mail-qg0-f44.google.com
	[209.85.192.44])
	by mail.openembedded.org (Postfix) with ESMTP id D14E565C7C
	for <openembedded-devel@lists.openembedded.org>;
	Fri,  7 Nov 2014 10:59:49 +0000 (UTC)
Received: by mail-qg0-f44.google.com with SMTP id q107so2214357qgd.3
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 07 Nov 2014 02:59:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:sender:in-reply-to:references:from:date:message-id
	:subject:to:cc:content-type;
	bh=20YCvkgx2QBxlouvGGVeWMR+uI8apBzqwZwEFJtBZBU=;
	b=OK1M4uTJcNJebgun57H7dN8pOfzaoI+y0nVKOsnI2mc+o1TM8/zcXVJWG7skYM0fh9
	azf/nPg5ImoH+K3kfE4s+zajp3JP7S5FpPLDBomxBIMYyMNfHLuLXXt0jBuOEUWkyoAI
	B4h8U4fR0Ql6Vpxh+caIb/ueRQ27HnwHZag73FeTaCe4KjqxcPBajb9nVZCoTmjIGVVo
	M1LXJ7cD0yid0gVRNvNbMe/LRJ+Yf46kthc94tITaa7MZcwAut/mUPqY+eoPewg1hmtS
	JZ19KScsSYGYgYcpY0c8ipbx6AumYh4ztwO8V5XiqR9ANhfH+UVv3GmYDVOjr/8jvo8W
	Ejhg==
X-Received: by 10.224.130.71 with SMTP id r7mr16138290qas.69.1415357990309;
	Fri, 07 Nov 2014 02:59:50 -0800 (PST)
MIME-Version: 1.0
Sender: paul.betafive@gmail.com
Received: by 10.140.143.146 with HTTP; Fri, 7 Nov 2014 02:59:10 -0800 (PST)
In-Reply-To: <2cc110b58da14640a9cb17d57ef353d4@BLUPR05MB037.namprd05.prod.outlook.com>
References: <e27387e29a0b4a7ea1620837f6507de1@BLUPR05MB037.namprd05.prod.outlook.com>
	<CANyK_8eahU+SLTCO_B8GhW3uZVsf-UtGsWSW628uCCPAwpb_og@mail.gmail.com>
	<2cc110b58da14640a9cb17d57ef353d4@BLUPR05MB037.namprd05.prod.outlook.com>
From: Paul Barker <paul@paulbarker.me.uk>
Date: Fri, 7 Nov 2014 10:59:10 +0000
X-Google-Sender-Auth: GVFMNzDhLWcD4I-W7Zs4hiT3ekg
Message-ID: <CANyK_8fXn20uhRoO7+iamLhf3+TibzQEL6kgqZ_-aK+y9fV5XA@mail.gmail.com>
To: Bryan Evenson <bevenson@melinkcorp.com>
Cc: "openembedded-devel@lists.openembedded.org"
	<openembedded-devel@lists.openembedded.org>
Subject: Re: Upgrading files identified as CONFFILES?
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
X-List-Received-Date: Fri, 07 Nov 2014 10:59:52 -0000
Content-Type: text/plain; charset=UTF-8

On 6 November 2014 15:28, Bryan Evenson <bevenson@melinkcorp.com> wrote:
> Paul,
>
>> -----Original Message-----
>> From: openembedded-devel-bounces@lists.openembedded.org
>> [mailto:openembedded-devel-bounces@lists.openembedded.org] On
>> Behalf Of Paul Barker
>> Sent: Thursday, November 06, 2014 9:36 AM
>> To: OE Devel
>> Subject: Re: [oe] Upgrading files identified as CONFFILES?
>>
>> On 6 November 2014 14:06, Bryan Evenson <bevenson@melinkcorp.com>
>> wrote:
>> > All,
>> >
>> > First, please let me know if I should be directing this to a different OE/yocto
>> mailing list; I have a hard time figuring out which list is appropriate at times.
>> >
>> > I am on poky/dylan and am using NTP on my target system.  I would like to
>> change the configuration for NTP and push out the changes to devices that
>> are firmware upgradable.  I made the change and pushed out the upgrade,
>> but I see that ntp.conf did not get changed on at least one of the systems
>> (the first one I checked).  Now I see that ntp.conf is listed under CONFFILES
>> in the main ntp recipe (http://www.yoctoproject.org/docs/1.7/mega-
>> manual/mega-manual.html#var-CONFFILES), which explains why it was not
>> upgraded.
>> >
>> > First, I want to confirm how the CONFFILES parameter works.  If a file is
>> listed under CONFFILES, is that file never modified during an upgrade or is it
>> only upgraded if it has not been modified (matches the default file from the
>> previous package version)?  I am using opkg for package management if that
>> makes a difference.
>> >
>> > Second, how do I force the NTP configuration to be upgraded?  For my
>> system, the user has no interface to modify the NTP configuration.  So even
>> though it is a configuration file, in my case I want ntp.conf to always match
>> the version provided by the upgraded package.
>> >
>> > Thanks,
>> > Bryan
>> >
>>
>> This largely depends on the package manager. I can tell you how opkg
>> works... If a file is listed in CONFFILES it is backed up before an update is
>> applied. By default, if a conffile has changed, the new changes go into a file
>> named "%s-opkg" where %s is the original file name. If "--force-maintainer"
>> is passed as an argument or the option "force_maintainer" is set, the new
>> changes overwrite the version in the file system. In opkg v0.3.0 there will be
>> a new "--ignore-maintainer" argument and "ignore_maintainer" option to
>> keep the conffile unmodified but not store the changes in "%s-opkg".
>>
>> Hope that helps,
>>
>
> Thanks for the detailed explanation.  And just to explore my options, if I were to add the following in my ntp bbappend:
>
> CONFFILES_${PN} = ""
>
> would that remove ntp.conf from the CONFFILES list and force the configuration to be updated each time it changes?
>
> Thanks,
> Bryan

It looks like the list of CONFFILES is taken from the version of the
package being installed. So if a file is listed in CONFFILES for the
old version but not the new version, it won't be treated as a conf
file and should just be overwritten.

This isn't a behaviour I've looked at in detail so please let me know
if it works.

Thanks,

-- 
Paul Barker

Email: paul@paulbarker.me.uk
http://www.paulbarker.me.uk

