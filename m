Return-Path: <philip@balister.org>
Received: from starfish.geekisp.com (starfish.geekisp.com [216.168.135.166])
	by mail.openembedded.org (Postfix) with SMTP id 2CB4C71492
	for <openembedded-devel@lists.openembedded.org>;
	Thu,  4 Sep 2014 17:54:48 +0000 (UTC)
Received: (qmail 10786 invoked by uid 1003); 4 Sep 2014 17:54:49 -0000
Received: from unknown (HELO ?192.168.1.123?) (philip@opensdr.com@71.171.37.28)
	by mail.geekisp.com with (DHE-RSA-AES128-SHA encrypted) SMTP;
	4 Sep 2014 17:54:49 -0000
Message-ID: <5408A766.5000605@balister.org>
Date: Thu, 04 Sep 2014 13:54:46 -0400
From: Philip Balister <philip@balister.org>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:24.0) Gecko/20100101 Thunderbird/24.7.0
MIME-Version: 1.0
To: openembedded-devel@lists.openembedded.org
References: <CAJTo0LaRETJdKG-bL+40YtGrVjs4MLVLiydybSUj5ALa2tyxUQ@mail.gmail.com>	<CAJTo0LYhvZHJEEQLWuCsfxqqbBCSXnxR3cxJZJt2Z0fgYgwEww@mail.gmail.com>
	<CALbNGRRVvT7Qv868RNWbo8_DjLwkbUjOH_cCNMjPNifFEcHu3g@mail.gmail.com>
In-Reply-To: <CALbNGRRVvT7Qv868RNWbo8_DjLwkbUjOH_cCNMjPNifFEcHu3g@mail.gmail.com>
Subject: Re: Style issue for recipes
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
X-List-Received-Date: Thu, 04 Sep 2014 17:54:52 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 8bit

On 09/04/2014 01:29 PM, Andreas Müller wrote:
> On Thu, Sep 4, 2014 at 6:34 PM, Burton, Ross <ross.burton@intel.com> wrote:
>> On 4 September 2014 15:12, Burton, Ross <ross.burton@intel.com> wrote:
>>> Quick question of style for the community to bikeshed on:  in the
>>> general case should recipes be split into foo_1.2.bb and foo.inc, or
>>> should they only split to bb/inc if there are multiple versions and
>>> generally there should just be foo_1.2.bb.
>>
>> Another argument against widespread inc files: they encourage the
>> impression that maintaining multiple versions is just a matter of
>> having a .inc file.  The moment you start having to put
>> version-specific statements into a .bb you've entered a world of pain
>> in keeping the .bb files in sync, moving options into the .inc as they
>> become used by all versions, and purging old version-specific
>> statements.
>>
>> Ross
>> --
> I agree with Ross: It often took me time to find out where
> functionality comes from. Inc-files do only make sense for multiple
> versions of recipes or if different recipes share same code (only
> example I can remember is meta-gnome gvfs/gvfs-gdu-volume-monitor
> circular-dependency hack).
> 
> My feeling is that the inc-files are still from classic oe times where
> we had multiple versions for many recipes and most can be merged into
> recipes without loosing something.

The qwt recipe uses an include file and two bb files for qt versus
qt-embedded builds. I do not know if this is wise, but it is a case not
mentioned here.

Philip




> 
> Andreas
> 

