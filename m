Return-Path: <openembedded@emagii.com>
Received: from v-smtpout2.han.skanova.net (v-smtpout2.han.skanova.net
	[81.236.60.155])
	by mail.openembedded.org (Postfix) with ESMTP id 7081673216
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 20 Jun 2016 22:02:14 +0000 (UTC)
Received: from [10.175.196.110] ([155.4.129.69]) by cmsmtp with SMTP
	id F7GkboFr9qtwZF7GlbRAuL; Tue, 21 Jun 2016 00:02:11 +0200
To: openembedded-devel@lists.openembedded.org
References: <7fb5e28e-d153-a396-58ae-c4d656835524@emagii.com>
	<6c3c2d7a-0b1e-fb20-1be9-679b3a728dcb@smile.fr>
	<01564453-efa0-c067-83bc-67f995a86452@emagii.com>
	<8646f486-90f9-738d-9daf-6ba1644c83ba@smile.fr>
From: Ulf Samuelsson <openembedded@emagii.com>
Message-ID: <16a6d5ea-a179-f36b-6a64-2a8c790e662f@emagii.com>
Date: Tue, 21 Jun 2016 00:02:12 +0200
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:45.0) Gecko/20100101
	Thunderbird/45.1.1
MIME-Version: 1.0
In-Reply-To: <8646f486-90f9-738d-9daf-6ba1644c83ba@smile.fr>
X-CMAE-Envelope: MS4wfG3tZaT2P3T3blw2RSmUiQMRV/K6vIIffd0qwhs+Qj+nlVTI9b4s0PnCeNME0sgeDEJtmsTjlcuQchpjegqx+QMk/AIjcSi0ZlynW1LVPL5Kj6YxjSsl
	K1dPxtObi6o1VvUIx/48Jq38kNfNzwE2UOttbsrqexffDEUO+di5R9K0pCW+YelLHP00VrACxhxA6gAHzTz5IlRyTWoK/hcf0Ks=
Subject: Re: Using EXTERNALSRC in practice
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
X-List-Received-Date: Mon, 20 Jun 2016 22:02:15 -0000
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: 8bit

Den 2016-06-20 kl. 15:58, skrev Jérémy Rosen:
>
>
> On 20/06/2016 15:48, Ulf Samuelsson wrote:
>> Den 2016-06-20 kl. 14:37, skrev Jérémy Rosen:
>>>
>>> On 20/06/2016 14:08, Ulf Samuelsson wrote:
>>>> We have a meta-layer which builds the kernel.
>>>>
>>>> This contains among other things:
>>>>
>>>> FILESEXTRAPATHS_prepend_<machine> = "${THIS_DIR}/<machine>"
>>>>
>>>> SRC_URI = "git://<server>/<repo.git>;protocol=ssh;branch=<branch>"
>>>> SRC_URI += "file://defconfig"
>>>>
>>>> PV = "...+git${SRCPV}"
>>>> SRCREV = "<shaid>"
>>>> ...
>>>>
>>>> Would like to have an option to build the kernel with external source.
>>>> That option should be easy to enable/disable
>>>>
>>> [skip the rest]
>>>
>>> What you are describing here is very close to how the devtool works. 
>>> I think it can deal with kernel packages in its latest iteration
>>>
>>> did you have a look at that tool ? does it satisfy your need ? if 
>>> not, what would it need to do what you want...
>>
>> No, where can I find more information?
>>
> The yocto manual has quite a section on that tool
>
>> The customer does not use the latest version of Yocto right now, so 
>> that might be a problem,
>
> depends on how old "not the latest" is... but if you can do a sandbox 
> with the latest version, you can probably see how devtool works and 
> manually do the same thing...

They use Yocto Layers, but not poky, so devtool is not present.
Anyway, devtool will generate an absolute path, and I am looking for
a recipe which uses a relative path to allow multiple yocto instances.

projects
         project1
                 yocto
                         kernelsrc + patchset1
         project2
                 yocto
                         kernelsrc + patchset2
         project3
                 yocto
                         kernelsrc + patchset3
         project4
                 yocto
                         kernelsrc + patchset4

Is there any way I can from inside a bbappend file find out the path to 
that bbappend file?


>>
>> so It would be good to have an example ".bbappend" to start with.
>>
>> BR
>>
>> Ulf
>>
>>
>


