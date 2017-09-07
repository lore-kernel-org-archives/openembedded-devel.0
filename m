Return-Path: <philip@balister.org>
Received: from sanddollar.geekisp.com (sanddollar.geekisp.com
	[216.168.135.167])
	by mail.openembedded.org (Postfix) with ESMTP id 84D8777E8A
	for <openembedded-devel@lists.openembedded.org>;
	Thu,  7 Sep 2017 15:08:39 +0000 (UTC)
Received: (qmail 11939 invoked by uid 1003); 7 Sep 2017 15:08:40 -0000
Received: from unknown (HELO ?192.168.11.142?)
	(philip@opensdr.com@108.44.111.57)
	by mail.geekisp.com with (DHE-RSA-AES128-SHA encrypted) SMTP;
	7 Sep 2017 15:08:40 -0000
To: =?UTF-8?Q?Andreas_M=c3=bcller?= <schnitzeltony@googlemail.com>,
	Mark Hatle <mark.hatle@windriver.com>
References: <1504725809-12825-1-git-send-email-mark.hatle@windriver.com>
	<1504725809-12825-20-git-send-email-mark.hatle@windriver.com>
	<CALbNGRS8S=vdceyyRV2fuTyJnZFM0MsK=JWdVoWn_KAxu_SRsw@mail.gmail.com>
	<729ff654-8482-3c02-fe1e-fc88a1a90179@windriver.com>
	<CALbNGRSOSdckoQix8bc+ciAaiiNsqN1Y+TyHNoQPGfRSD8RTKQ@mail.gmail.com>
From: Philip Balister <philip@balister.org>
Message-ID: <040b8ebf-9900-1d6c-2c5f-9884f943a80e@balister.org>
Date: Thu, 7 Sep 2017 11:08:39 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.2.1
MIME-Version: 1.0
In-Reply-To: <CALbNGRSOSdckoQix8bc+ciAaiiNsqN1Y+TyHNoQPGfRSD8RTKQ@mail.gmail.com>
Cc: "openembedded-devel@lists.openembedded.org"
	<openembedded-devel@lists.openembedded.org>
Subject: Re: [PATCH 19/31] glade3: Move PACKAGECONFIG setting to enable_gnome.conf
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
X-List-Received-Date: Thu, 07 Sep 2017 15:08:39 -0000
Content-Type: text/plain; charset=utf-8
Content-Language: en-MW
Content-Transfer-Encoding: 8bit

On 09/07/2017 10:51 AM, Andreas Müller wrote:
> On Thu, Sep 7, 2017 at 3:45 PM, Mark Hatle <mark.hatle@windriver.com> wrote:
>> On 9/7/17 4:29 AM, Andreas Müller wrote:
>>> On Wed, Sep 6, 2017 at 9:23 PM, Mark Hatle <mark.hatle@windriver.com> wrote:
>>>> This resolves a failure of the yocto-compat-layer.py script.  Changing the
>>>> PACKAGECONFIG setting by just including a layer can cause problems.
>>>>
>>>> Signed-off-by: Mark Hatle <mark.hatle@windriver.com>
>>>> ---
>>>>  meta-gnome/conf/enable_gnome.conf                   | 2 ++
>>>>  meta-gnome/recipes-devtools/glade/glade3_%.bbappend | 1 -
>>>>  2 files changed, 2 insertions(+), 1 deletion(-)
>>>>  delete mode 100644 meta-gnome/recipes-devtools/glade/glade3_%.bbappend
>>>>
>>>> diff --git a/meta-gnome/conf/enable_gnome.conf b/meta-gnome/conf/enable_gnome.conf
>>>> index 883a6f5..7e711ee 100644
>>>> --- a/meta-gnome/conf/enable_gnome.conf
>>>> +++ b/meta-gnome/conf/enable_gnome.conf
>>>> @@ -1 +1,3 @@
>>>>  AVAHI_GTK_pn-avahi-ui = "gtk gtk3"
>>>> +
>>>> +PACKAGECONFIG_pn-glade3 = "gnome"
>>>> diff --git a/meta-gnome/recipes-devtools/glade/glade3_%.bbappend b/meta-gnome/recipes-devtools/glade/glade3_%.bbappend
>>>> deleted file mode 100644
>>>> index 3abacfb..0000000
>>>> --- a/meta-gnome/recipes-devtools/glade/glade3_%.bbappend
>>>> +++ /dev/null
>>>> @@ -1 +0,0 @@
>>>> -PACKAGECONFIG ??= "gnome"
>>>> --
>>>> 1.8.3.1
>>>>
>>> Yet another stupid question (yes I need gnome support for working with
>>> glade3): How is enable_gnome.conf supposed to be activated?
>>>
>>> For the record: This is yet another patch kicking things off for the
>>> sake of yocto-compat-layer script. Is meta-gnome supposed to be yocto
>>> compatible? Was this decided by 'community'?
>>
>> See the cover letter:
>>
>> [18/31] enable_gnome.conf: Move the AVAHI_GTK setting
>> - The yp-compat script does not allow a layer to modify the system wide
>> configuration (including modifying other recipe behavior).  The AVHAI_GTK
>> changes the behavior of that recipe, which is detected by the script.  So
>> I choose to move this to a configuration file that will need to be required
>> by the user IF they want avahi to use GTK.  I'm not happy with this, but I
>> don't see any other way to meet the requirements.
>>
>> [19/31] glade3: Move PACKAGECONFIG setting to enable_gnome.conf
>> - Similar to the above, but with PACKAGECONFIG this time.
>>
>> I don't see an alternative here due to this requirement.  As I said before you
>> guys maintain meta-openembedded, I don't.  If this doesn't work (and I never
>> expected it to) then reject the patch and don't merge it.
> Your approach scares me - really: Somebody creates a magic script says
> 'this is it', calls it community driven and you send out patches which
> break things and you don't care - or even worse you expect them to
> break things. You guys are aware of what we are doing here: Major
> target is building working images - right?
> 
> This is not the community I want to waste further time on

It is pretty clear Mark does care about the impact of the compat testing
on people and layers.

I think it is a good thing to automate testing for recipes that have
possibly bad behaviour and communicating this behaviour to layer
maintainers.

The topic of what sorts of things layers should and should not do has
been discussed many times at developer meetings. We are trying to make
sure all layers behave in predictable ways, this script is part of that
ongoing work.

You have the option of rejecting this patch, but at least make sure the
layer README notes what can happen when you add this layer to your stack.

Philip

> 
> Andreas
> 

