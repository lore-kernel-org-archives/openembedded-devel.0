Return-Path: <Randy.MacLeod@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 4BDB07136A
	for <openembedded-devel@lists.openembedded.org>;
	Wed,  3 Sep 2014 15:07:04 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.14.9/8.14.5) with ESMTP id s83F5tFg010885
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL);
	Wed, 3 Sep 2014 08:05:56 -0700 (PDT)
Received: from [128.224.56.84] (128.224.56.84) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.3.174.1;
	Wed, 3 Sep 2014 08:05:55 -0700
Message-ID: <54072E52.208@windriver.com>
Date: Wed, 3 Sep 2014 11:05:54 -0400
From: Randy MacLeod <randy.macleod@windriver.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:31.0) Gecko/20100101 Thunderbird/31.0
MIME-Version: 1.0
To: ChenQi <Qi.Chen@windriver.com>, <openembedded-devel@lists.openembedded.org>
References: <5406C319.3030402@windriver.com>
In-Reply-To: <5406C319.3030402@windriver.com>
X-Originating-IP: [128.224.56.84]
Cc: koen@dominion.thruhere.net
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
X-List-Received-Date: Wed, 03 Sep 2014 15:07:11 -0000
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: 7bit

On 14-09-03 03:28 AM, ChenQi wrote:
> Hi All,
>
> In the next period, we are going to add systemd support (mostly systemd
> unit files) to recipes in meta-oe, meta-networking and meta-webserver.
>
> If some of you are interested in doing such work, or you have being
> doing work in this area, please let us know so that we don't duplicate
> work.
>
> Best Regards,
> Chen Qi


Here's the list of recipes for which we _intend_ to
add systemd support over the coming weeks:

meta-oe:

  collectd        Script: collectd
  postgresql      Script: postgresql-server
  samba           Script: samba winbind
  smartmontools   Script: smartd


meta-networking:

  arptables       Script: arptables
  conntrack-tools Script: conntrackd conntrack-failover
  ebtables        Script: ebtables
  init-ifupdown   Script: networking
  memcached       Script: memcached
  netcf           Script: (?????)
  proftpd         Script: proftpd
  quagga          Script: quagga watchquagga
  radvd           Script: radvd
  rp-pppoe        Script: pppoe-server
  snort           Script: snort
  tftp-hpa        Script: tftpd-hpa
  vsftpd          Script: vsftpd
  xl2tpd          Script: xl2tpd


meta-webserver:

  nginx           Script: nginx
  nostromo        Script: nostromo
  webmin          Script: webmin

I looked for systemd bbappends using:
    http://layers.openembedded.org/layerindex/branch/master/recipes/
but didn't find any.


I need to figure out what if anything to do with meta-systemd.
The intent of that layer has probably been explained in the email logs
and I suspect that I should look at how meta-angstrom uses it but
I won't have time to do those investigations until later today.


-- 
# Randy MacLeod. SMTS, Linux, Wind River
Direct: 613.963.1350

