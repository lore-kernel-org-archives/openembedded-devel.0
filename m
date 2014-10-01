Return-Path: <denis@denix.org>
Received: from vms173019pub.verizon.net (vms173019pub.verizon.net
	[206.46.173.19])
	by mail.openembedded.org (Postfix) with ESMTP id E00D96A9D4
	for <openembedded-devel@lists.openembedded.org>;
	Wed,  1 Oct 2014 01:22:58 +0000 (UTC)
Received: from gandalf.denix.org ([unknown] [108.18.33.160])
	by vms173019.mailsrvcs.net
	(Sun Java(tm) System Messaging Server 7u2-7.02 32bit (built Apr 16
	2009)) with ESMTPA id <0NCQ00GB9RTI5T00@vms173019.mailsrvcs.net> for
	openembedded-devel@lists.openembedded.org; Tue,
	30 Sep 2014 20:22:41 -0500 (CDT)
Received: by gandalf.denix.org (Postfix, from userid 1000)	id 8FF6E20141; Tue,
	30 Sep 2014 21:22:30 -0400 (EDT)
Date: Tue, 30 Sep 2014 21:22:30 -0400
From: Denys Dmytriyenko <denis@denix.org>
To: openembedded-devel@lists.openembedded.org
Message-id: <20141001012230.GP2480@denix.org>
References: <542AE566.80708@balister.org>
MIME-version: 1.0
In-reply-to: <542AE566.80708@balister.org>
User-Agent: Mutt/1.5.20 (2009-06-14)
Subject: Re: Hostapd recipe is DEFAULT_PREFENCE = "-1"
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
X-List-Received-Date: Wed, 01 Oct 2014 01:23:00 -0000
Content-type: text/plain; charset=us-ascii
Content-disposition: inline

On Tue, Sep 30, 2014 at 10:16:22AM -0700, Philip Balister wrote:
> Does anyone know why the hostapd recipe is DEFAULT_PREFERENCE = "-1"

git log is your friend. It shows that it was imported that way from OE 
classic. And in OE classic there were 4 different versions available, the 
latest being marked with D_P=-1, probably because of less testing...

-- 
Denys

