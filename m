Return-Path: <paul.eggleton@linux.intel.com>
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
	by mail.openembedded.org (Postfix) with ESMTP id 4D77F70F28
	for <openembedded-devel@lists.openembedded.org>;
	Wed,  3 Sep 2014 15:56:59 +0000 (UTC)
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by orsmga102.jf.intel.com with ESMTP; 03 Sep 2014 08:50:53 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.04,458,1406617200"; d="scan'208";a="597371408"
Received: from svgunawa-mobl.gar.corp.intel.com (HELO
	peggleto-mobl5.ger.corp.intel.com) ([10.252.120.16])
	by orsmga002.jf.intel.com with ESMTP; 03 Sep 2014 08:56:54 -0700
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: Randy MacLeod <randy.macleod@windriver.com>
Date: Wed, 03 Sep 2014 16:56:53 +0100
Message-ID: <1666530.MBVyTItIEP@peggleto-mobl5.ger.corp.intel.com>
Organization: Intel Corporation
User-Agent: KMail/4.13.3 (Linux/3.15.10-201.fc20.x86_64; KDE/4.13.3; x86_64; ;
	)
In-Reply-To: <54072E52.208@windriver.com>
References: <5406C319.3030402@windriver.com> <54072E52.208@windriver.com>
MIME-Version: 1.0
Cc: koen@dominion.thruhere.net, openembedded-devel@lists.openembedded.org
Subject: Re: systemd support for recipes in meta-openembedded
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
X-List-Received-Date: Wed, 03 Sep 2014 15:57:01 -0000
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"

On Wednesday 03 September 2014 11:05:54 Randy MacLeod wrote:
> On 14-09-03 03:28 AM, ChenQi wrote:
> > In the next period, we are going to add systemd support (mostly systemd
> > unit files) to recipes in meta-oe, meta-networking and meta-webserver.
> > 
> > If some of you are interested in doing such work, or you have being
> > doing work in this area, please let us know so that we don't duplicate
> > work.
> 
> Here's the list of recipes for which we _intend_ to
> add systemd support over the coming weeks:
> 
> meta-oe:
> 
>   collectd        Script: collectd
>   postgresql      Script: postgresql-server
>   samba           Script: samba winbind
>   smartmontools   Script: smartd
> 
> 
> meta-networking:
> 
>   arptables       Script: arptables
>   conntrack-tools Script: conntrackd conntrack-failover
>   ebtables        Script: ebtables
>   init-ifupdown   Script: networking
>   memcached       Script: memcached
>   netcf           Script: (?????)
>   proftpd         Script: proftpd
>   quagga          Script: quagga watchquagga
>   radvd           Script: radvd
>   rp-pppoe        Script: pppoe-server
>   snort           Script: snort
>   tftp-hpa        Script: tftpd-hpa
>   vsftpd          Script: vsftpd
>   xl2tpd          Script: xl2tpd
> 
> 
> meta-webserver:
> 
>   nginx           Script: nginx
>   nostromo        Script: nostromo
>   webmin          Script: webmin
> 
> I looked for systemd bbappends using:
>     http://layers.openembedded.org/layerindex/branch/master/recipes/
> but didn't find any.
> 
> 
> I need to figure out what if anything to do with meta-systemd.
> The intent of that layer has probably been explained in the email logs
> and I suspect that I should look at how meta-angstrom uses it but
> I won't have time to do those investigations until later today.

There's not a lot left in meta-systemd; it been chipped away as the relevant 
support has been added into the corresponding recipes.

Here is a quick script that shows the parts that may still need looking at:

  https://gist.github.com/bluelightning/fd4a54d64b5619e20d5f

It looks like Chen's patchset has just landed in OE-Core master; I haven't 
looked at the changes closely but it seems like a few of the remaining non-
trivial bbappends may now be able to be pared down to just the 
RDEPENDS/RRECOMMENDS/RREPLACES lines (e.g. keymaps, dhcp, at).

The sooner meta-systemd can be labelled as only interesting to those needing 
the RDEPENDS/RRECOMMENDS/RREPLACES for the old packaging, the better IMO, so I 
really appreciate this work, thanks!

Cheers,
Paul

-- 

Paul Eggleton
Intel Open Source Technology Centre

