Return-Path: <ml@communistcode.co.uk>
Received: from owm.eumx.net (eumx.net [91.82.101.43])
	by mail.openembedded.org (Postfix) with ESMTP id DA10E6A456
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 24 Sep 2013 10:07:02 +0000 (UTC)
Message-ID: <52416442.9020907@communistcode.co.uk>
Date: Tue, 24 Sep 2013 11:06:58 +0100
From: Jack Mitchell <ml@communistcode.co.uk>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:24.0) Gecko/20100101 Thunderbird/24.0
MIME-Version: 1.0
To: openembedded-devel@lists.openembedded.org
References: <1380015325-28852-1-git-send-email-ml@communistcode.co.uk>
	<CAJTo0LbB3U6GjzdGyc3Ff+gNjstYdy7B3KUNAEUBLuUebDTVNQ@mail.gmail.com>
In-Reply-To: <CAJTo0LbB3U6GjzdGyc3Ff+gNjstYdy7B3KUNAEUBLuUebDTVNQ@mail.gmail.com>
Subject: Re: [meta-oe][PATCH 1/2] lm_sensors: add ALLOW_EMPTY to lmsensors and lmsensors-config
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
X-List-Received-Date: Tue, 24 Sep 2013 10:07:05 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit

On 24/09/13 10:52, Burton, Ross wrote:
> On 24 September 2013 10:35, Jack Mitchell <ml@communistcode.co.uk> wrote:
>> When building with dev-pkgs enabled I was hitting an error lmsensors-dev
>> not available. Adding ALLOW_EMPTY allowed the empty package to be created
>> and therefore satisfy the dependancy.
> 
> Your ALLOW_EMPTY statements only apply to lmsensors and
> lmsensors-config, not lmsensors-dev (as you're using just ${PN}), and
> surely you don't need it on the lmsensors-config recipe at all.
> 
> Ross

If I take out the ALLOW_EMPTY statements I get the following do_rootfs
error:

| Collected errors:
|  * satisfy_dependencies_for: Cannot satisfy the following dependencies
for lmsensors-config-dev:
|  * 	lmsensors-config (= 1.0-r0) *
|  * opkg_install_cmd: Cannot install package lmsensors-config-dev.
|  * satisfy_dependencies_for: Cannot satisfy the following dependencies
for lmsensors-dev:
|  * 	lmsensors (= 3.3.3-r0) *
|  * opkg_install_cmd: Cannot install package lmsensors-dev.
| WARNING:
/home/jack/Work/oe-core.git/test-build/tmp-eglibc/work/cbnlcomexpress-oe-linux/cbnl-dev-image/1.0-r0/temp/run.do_rootfs.6333:1
exit 255 from
|   opkg-cl -f $INSTALL_CONF_IPK -o $INSTALL_ROOTFS_IPK
--force_postinstall --prefer-arch-to-version install `cat $1`
| ERROR: Function failed: do_rootfs (log file is located at
/home/jack/Work/oe-core.git/test-build/tmp-eglibc/work/cbnlcomexpress-oe-linux/cbnl-dev-image/1.0-r0/temp/log.do_rootfs.6333)

The only dependancy I have is lmsensors-sensord. Could it possibly be a
bug with the dev-pkgs image feature if it shouldn't be selecting these
packages for install?

Cheers,
Jack.


