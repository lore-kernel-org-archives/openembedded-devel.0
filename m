Return-Path: <Randy.MacLeod@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id EA3F27663C
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 31 Jul 2015 18:32:38 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.15.1/8.15.1) with ESMTPS id t6VIWcOl006907
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL);
	Fri, 31 Jul 2015 11:32:39 -0700 (PDT)
Received: from [172.25.44.6] (172.25.44.6) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.3.235.1;
	Fri, 31 Jul 2015 11:32:18 -0700
Message-ID: <55BBBF42.8030403@windriver.com>
Date: Fri, 31 Jul 2015 14:32:34 -0400
From: Randy MacLeod <randy.macleod@windriver.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:31.0) Gecko/20100101 Thunderbird/31.8.0
MIME-Version: 1.0
To: Joe MacDonald <Joe_MacDonald@mentor.com>,
	"openembedded-devel@lists.openembedded.org"
	<openembedded-devel@lists.openembedded.org>
References: <55BB022B.6050800@windriver.com> <20150731173331.GC5208@mentor.com>
In-Reply-To: <20150731173331.GC5208@mentor.com>
X-Originating-IP: [172.25.44.6]
Cc: "Radzykewycz, T \(Radzy\)" <radzy@windriver.com>
Subject: [meta-selinux] Re: meta-selinux updates for oe-core-1.9
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
X-List-Received-Date: Fri, 31 Jul 2015 18:32:43 -0000
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit

Going on-list like I should have originally.

On 2015-07-31 01:33 PM, Joe MacDonald wrote:
> Hey Randy,
>
> Good to hear from you.
>
> [meta-selinux updates for oe-core-1.9] On 15.07.31 (Fri 01:05) Randy MacLeod wrote:
>
>> What's the plan for meta-selinux in the next 2 months?

Roy dug up the current meta-selinux, upstream versions:

swig             2.0.10        3.0.6
python-ipy         0.81         0.83
audit             2.3.2        2.4.3
refpolicy-mls 2.20140311　　　　2.20141203
libcap-ng         0.7.3        0.7.7
setools           3.3.8        3.3.8
sepolgen            git        1.2.2
libsemanage         git          2.4
checkpolicy         2.3          2.4
policycoreutils     git          2.4
selinux-config      0.1          0.1
libsepol            git          2.4
libsemanage         2.3          2.4
sepolgen          1.2.1        1.2.2
libsepol            2.3          2.4
libselinux          git          2.4
policycoreutils     2.3          2.4
libselinux          2.3          2.4
ustr              1.0.4        1.0.4


>
> There's a backlog of meta-selinux patches to integrate that have been in
> my merge queue for rather a long time now.  I expect to clear that out,
> which will include an update to the most recent (not the current, any
> longer, I don't think) refpolicy and a new recipe that will build from
> the refpolicy git repository rather than release tarballs.  I think
> this'll be a significant benefit to everyone in that it'll make it much
> easier to migrate patches and to try out a new release without waiting
> for a full update.  Those are the big things on the horizon.
>
> The other one is the filesystem labelling work being done by the
> community.  It looks quite good and as soon as I get a few minutes to
> try it out a bit more on some oddball configurations to ensure we aren't
> bringing in any new dependencies (after having just scrubbed a bunch of
> bashisms and hidden deps), it'll likely get merged.
>
> There's nothing on the radar in the short term that hasn't already been
> discussed on the mailing list, though, AFAIK.
>
> -J.

So when Radzy is back in a week from being OOO, hopefully Joe's backlog
will be cleared and we all can update pkgs as needed. We can split
up that work however it makes sense; just tell the list
if you start working on a package.

My quick review of git logs and my memory of selinux releases
tells me that there tends to be an late fall release.
I looked at the Changelog for a few of the components of:
    https://github.com/SELinuxProject/selinux
and things seem to be moving along more quickly than usual
so that pattern might not hold. Is anyone subscribed to the list:
    https://www.nsa.gov/research/selinux/list.shtml
if so is there talk of an approximate release date that
would help us decide if we went to update now or in a month or so?

Oh and is selinux happy under gcc-5.2+?

../Randy


>
>>
>> Roy can you summarize the state of each recipe?
>> i.e. current version and upstream version?
>> I'd like to make sure that we're up to date when
>> oe-core-1.9 is released.
>>


-- 
# Randy MacLeod. SMTS, Linux, Wind River
Direct: 613.963.1350 | 350 Terry Fox Drive, Suite 200, Ottawa, ON, 
Canada, K2K 2W5

