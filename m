Received: from mail-ve0-f175.google.com ([209.85.128.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <schnitzeltony@googlemail.com>) id 1UXCqJ-0005rQ-HF
	for openembedded-devel@lists.openembedded.org;
	Tue, 30 Apr 2013 17:51:59 +0200
Received: by mail-ve0-f175.google.com with SMTP id m1so494772ves.20
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 30 Apr 2013 08:33:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=googlemail.com; s=20120113;
	h=mime-version:x-received:in-reply-to:references:date:message-id
	:subject:from:to:content-type;
	bh=L+E4WL9xe+Lct3QMaIQLmXdQ43qbOdg5GNVE/Qc+Bq8=;
	b=kTmznT4oh+Tw9dQD+tFpX4iklF3LIJkkNJVjlVrkRZ5ebKr7GmC8EWE7obEnM6ff6R
	JXofA1wUNu9hsUk3VLBYZneM3dyyPOg7ka9Awt9pnWJY8T4AZc8MM5DaBowXUpGz0nOH
	p/YVZljIenqyg9jrp3t3o6G7khmMqA0zqMJaneKPDR8qoDBow34hspqMvd9ghnhrJGzl
	wzCffRFKImmXcLGiocHhVEQL/5sofd4Ea3RRIfkWfqCcBWF2NKDNOko0rxdG+T+IaRfN
	vfW3KcvVSG1fhR50FbWcPxZKx0+nMuOgHh0tDrZTK9C7Y7KaA0NFfwW9F1gLWgwxsM8t
	ihfw==
MIME-Version: 1.0
X-Received: by 10.52.33.236 with SMTP id u12mr29397137vdi.101.1367336036415;
	Tue, 30 Apr 2013 08:33:56 -0700 (PDT)
Received: by 10.52.183.36 with HTTP; Tue, 30 Apr 2013 08:33:56 -0700 (PDT)
In-Reply-To: <CAP9ODKrUJgBvJSocDxp15PtLtP8ObW-+-OgdedbSDt=1ALR9ow@mail.gmail.com>
References: <CAP9ODKpttkSQqRinJQWmDhWTeE+iXJWnLBDqZ1rsath6tJ2Xmw@mail.gmail.com>
	<CAJTo0LaF8rOcnfVFhqwrtsfAK3Pu4i79Zz27RV7XPpdo0UZU1Q@mail.gmail.com>
	<CAP9ODKrUJgBvJSocDxp15PtLtP8ObW-+-OgdedbSDt=1ALR9ow@mail.gmail.com>
Date: Tue, 30 Apr 2013 17:33:56 +0200
Message-ID: <CALbNGRQH1DbJXwONhYrZ6x0Lze38xtndUfs+mDcenxLZ-DD8Jg@mail.gmail.com>
From: =?UTF-8?Q?Andreas_M=C3=BCller?= <schnitzeltony@googlemail.com>
To: openembedded-devel@lists.openembedded.org
Subject: Re: [meta-gnome] gvfs build error
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
X-List-Received-Date: Tue, 30 Apr 2013 15:52:05 -0000
Content-Type: text/plain; charset=UTF-8

On Tue, Apr 30, 2013 at 5:22 PM, Otavio Salvador
<otavio@ossystems.com.br> wrote:
> On Tue, Apr 30, 2013 at 11:58 AM, Burton, Ross <ross.burton@intel.com> wrote:
>> On 30 April 2013 15:42, Otavio Salvador <otavio@ossystems.com.br> wrote:
>>> Hello,
>>>
>>> Did someone see:
>>>
>>> | metatree.c:71:1: error: unknown type name 'GStaticRWLock'
>>> | metatree.c:71:38: error: 'G_STATIC_RW_LOCK_INIT' undeclared here
>>> (not in a function)
>>> | metatree.c: In function 'meta_tree_ref':
>>
>> Those APIs are deprecated in new GLibs, so maybe you've a newer GLib
>> and an older gvfs, potentially one that is disabling deprecated code
>> (which is bad form, and shouldn't be done in GNOME these days afaik).
>
> I think you're  right as it used to work fine and now it broke.
>
> It seems meta-gnome will need some love with master updates now :-)
>
A never ending love story :)

Andreas


