Received: from [74.125.78.149] (helo=ey-out-1920.google.com)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <ricardo.salveti@openbossa.org>) id 1LDlMy-0002zG-Tm
	for openembedded-devel@lists.openembedded.org;
	Fri, 19 Dec 2008 20:50:44 +0100
Received: by ey-out-1920.google.com with SMTP id 4so121368eyg.36
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 19 Dec 2008 11:46:03 -0800 (PST)
Received: by 10.210.68.17 with SMTP id q17mr4197735eba.50.1229715963704;
	Fri, 19 Dec 2008 11:46:03 -0800 (PST)
Received: by 10.210.89.5 with HTTP; Fri, 19 Dec 2008 11:46:03 -0800 (PST)
Message-ID: <ae9c9a1c0812191146w57c68982vbdaf345e833a0710@mail.gmail.com>
Date: Fri, 19 Dec 2008 16:46:03 -0300
From: "Ricardo Salveti de Araujo" <ricardo.salveti@openbossa.org>
To: openembedded-devel@lists.openembedded.org
In-Reply-To: <494B7C10.8090407@xora.org.uk>
MIME-Version: 1.0
References: <20081218071901.GB2135@buddha.tw.openmoko.com>
	<20081218150517.GI2135@buddha.tw.openmoko.com>
	<gidpuk$29d$1@ger.gmane.org>
	<1229619255.9166.66.camel@mill.internal.reciva.com>
	<gie3e0$6th$1@ger.gmane.org>
	<20081219053858.GQ2135@buddha.tw.openmoko.com>
	<494B7C10.8090407@xora.org.uk>
Subject: Re: openmoko-merges
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
X-List-Received-Date: Fri, 19 Dec 2008 19:50:45 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

On Fri, Dec 19, 2008 at 7:48 AM, Graeme Gregory <dp@xora.org.uk> wrote:
> John Lee wrote:
>> I'll keep working on the fastboot branch (need the help of original
>> author on this one.  since this will become general changes, it's not
>> going to be easy), and reorganize the om-merge branch a bit.  Is this
>> the first time of such a big merge ?  I think Graeme and I both did
>> some merge back before, but this one seems to be bigger...
>>
> I used to use a process similar to what koen suggested where I would
> only merge back into OE the final changes to a .bb not all the
> mistakes/fuckups/typos that got us to that result. Then evaluate each
> change on its own to judge its level of controversy.

Yep, this is something I was thinking about this week, where I decided
to reorganize the Mamona patches to merge it back to OE.

Merging related modifications in just one patch helps a lot to review
the code and also to merge it upstream, the bad part is that we lose
all the history behind those patches. Adding a message telling that
the patch came from Mamona helps this issue, as the user could see it
at the Mamona own repository, but still don't know what's the
preferred way.

What are your suggestions? Should I create branches and rebase Mamona
repo to do the merge with all the history or just merging related
commits in one is enough (also with branches and review)?

Thanks,
-- 
Ricardo Salveti de Araujo


