Received: from mail-ie0-f175.google.com ([209.85.223.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <andrei@gherzan.ro>) id 1T9Xmt-0001lu-RV
	for openembedded-devel@lists.openembedded.org;
	Thu, 06 Sep 2012 10:50:12 +0200
Received: by iebc11 with SMTP id c11so2676124ieb.6
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 06 Sep 2012 01:37:47 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=mime-version:x-originating-ip:in-reply-to:references:from:date
	:message-id:subject:to:content-type:x-gm-message-state;
	bh=76h8EIOGehw1Tr+V0l8TAcAZig8mwuj1/wPK7VRek1c=;
	b=NTX7APWArege4jtor4bffrN5Uq9Zuz3vFJidRl7xtSgONXhcIFWmNX/r7oF092W8I8
	LwdqoEGssUOHX8IF6SzJ9l3H3dk22/mAOwA2tWhsKarax20IAAytXwYW6je6p4Wa/Y/I
	dktHPsTygQrhsW0Bs0rCVZVJSNkfEkGv+pAdvrHUL2wp0y6w0irDpTs51SaTjLS39oS+
	jzU2RbwxeOvFnJoXU/FO/wUEMAVbd4Lvg/k0ZjiLlJ5IowPtk/+DCNuAyiKTn8CUICPV
	zNt+lw/h2oSgPhZ2DhPAobc4JjMWWCKhmI/cD2Zu6h4OHx09xJHmuAt1sKpPF1rY8XOl
	xt4g==
Received: by 10.42.39.197 with SMTP id i5mr1270840ice.27.1346920667020; Thu,
	06 Sep 2012 01:37:47 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.64.129.232 with HTTP; Thu, 6 Sep 2012 01:37:26 -0700 (PDT)
X-Originating-IP: [89.121.200.106]
In-Reply-To: <50485B04.4030002@communistcode.co.uk>
References: <1346853750-503-1-git-send-email-ml@communistcode.co.uk>
	<4375690.RKMBt9Sfd5@helios> <20120905192818.GR3372@jama.jama.net>
	<1718555.hFmUFu8O5x@helios> <50485B04.4030002@communistcode.co.uk>
From: Andrei Gherzan <andrei@gherzan.ro>
Date: Thu, 6 Sep 2012 11:37:26 +0300
Message-ID: <CAK18fxG+1gL2q4DL=3=wBQhyga70fONp-7uNhPiutqAUTMCMXg@mail.gmail.com>
To: openembedded-devel@lists.openembedded.org
X-Gm-Message-State: ALoCoQnCNaY6nRH63VjML69qs9A57uuT9X+r+qzjzey+l3t3tzej+njhVfLtOMvxRZHmyQeKgwyx
X-Content-Filtered-By: Mailman/MimeDel 2.1.11
Subject: Re: [PATCH 3/3] libcec: update libcec to latest version (1.8.2) as to include RasPi support
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
X-List-Received-Date: Thu, 06 Sep 2012 08:50:12 -0000
Content-Type: text/plain; charset=ISO-8859-1

On Thu, Sep 6, 2012 at 11:12 AM, Jack Mitchell <ml@communistcode.co.uk>wrote:

> On 05/09/12 22:32, Paul Eggleton wrote:
>
>> On Wednesday 05 September 2012 21:28:18 Martin Jansa wrote:
>>
>>> On Wed, Sep 05, 2012 at 03:16:10PM +0100, Paul Eggleton wrote:
>>>
>>>> It's not totally clear but it doesn't look like 1.8.2 has been released
>>>> yet judging from their website; if that's the case then PV should be set
>>>> to "1.8.1+git${SRCPV}".
>>>>
>>> Or rather
>>> "1.8.1+gitr${SRCPV}"
>>> like most meta-* recipes
>>>
>> This was discussed not that long ago IIRC - the r is superfluous for git.
>> In
>> fact if you look at most OE-Core recipes that use SRCPV they do not
>> precede it
>> with r.
>>
>> Cheers,
>> Paul
>>
>>
> So even though it is the 1.8.1 release commit it should still be tagged
> with the git SRCPV?
>
>
No. The SRCPV should be there to indicate that your version is something in
between 2 official versions. In your case as there is not
1.8.2 officially you state that this package is 1.8.1 but at a
later SRCPV commit.

You need v1.8.2? There is no rpi support in 1.8.1? Why don't you update to
that version?

Andrei

