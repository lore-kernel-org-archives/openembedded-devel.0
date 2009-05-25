Received: from [80.91.229.2] (helo=ciao.gmane.org)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <gcho-openembedded-devel@m.gmane.org>)
	id 1M8YMg-0006A8-83
	for openembedded-devel@openembedded.org; Mon, 25 May 2009 13:29:11 +0200
Received: from list by ciao.gmane.org with local (Exim 4.43)
	id 1M8YEw-0000fj-L2
	for openembedded-devel@openembedded.org; Mon, 25 May 2009 11:21:10 +0000
Received: from iap-pxy-mow1.siemens.ru ([212.248.25.26])
	by main.gmane.org with esmtp (Gmexim 0.1 (Debian))
	id 1AlnuQ-0007hv-00 for <openembedded-devel@openembedded.org>;
	Mon, 25 May 2009 11:21:10 +0000
Received: from dbaryshkov by iap-pxy-mow1.siemens.ru with local (Gmexim 0.1
	(Debian)) id 1AlnuQ-0007hv-00
	for <openembedded-devel@openembedded.org>;
	Mon, 25 May 2009 11:21:10 +0000
X-Injected-Via-Gmane: http://gmane.org/
To: openembedded-devel@openembedded.org
From: Dmitry Eremin-Solenikov <dbaryshkov@gmail.com>
Date: Mon, 25 May 2009 11:21:00 +0000 (UTC)
Message-ID: <gvduus$cuo$1@ger.gmane.org>
References: <fce2a370905250207g211af74fg29c1f0cd2593a4ae@mail.gmail.com>
	<1243246822.4869.19.camel@lenovo.internal.reciva.com>
Mime-Version: 1.0
X-Complaints-To: usenet@ger.gmane.org
X-Gmane-NNTP-Posting-Host: iap-pxy-mow1.siemens.ru
User-Agent: Pan/0.132 (Waxed in Black)
Sender: news <news@ger.gmane.org>
Subject: Re: [RFC] gnome.bbclass change broke lots of	package	dependencies
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
X-List-Received-Date: Mon, 25 May 2009 11:29:13 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Phil Blundell wrote:

> On Mon, 2009-05-25 at 12:07 +0300, Ihar Hrachyshka wrote:
>> @@ -17,6 +17,9 @@ inherit autotools gtk-icon-cache pkgconfig gconf mime
>> 
>>  AUTOTOOLS_STAGE_PKGCONFIG = "1"
>> 
>> +PACKAGES =+ "${PN}-scrollkeeper-leftovers"
>> +FILES_${PN}-scrollkeeper-leftovers =
>> "${localstatedir}/lib/scrollkeeper" +
>>  gnome_stage_includes() {
>>         autotools_stage_includes
>>  }
>> 
>> As we can see, there is now ${PN}-scrollkeeper-leftovers package for
>> every recipe that inherited gnome.bbclass. And this -leftovers package
>> is in the current dependency chains (at least for qt4-embedded-dev
>> package).
> 
> Where is your dependency on -scrollkeeper-leftovers coming from? Nothing
> in the patch that you quoted looks like it ought to be causing that.
> 
> That said, the patch does look a bit bizarre: as a general rule we don't
> package things from ${localstatedir} since lots of targets have that as
> a ramdisk.  It isn't obvious to me what this is going to achieve.

I can confirm the dependency part of this report. It's causing build
failures for me: see bug 5123. I've traced this to strange dependancies on
pango-scrollkeeper-leftovers from most of pango packages.



-- 
With best wishes
Dmitry




