Return-Path: <henning@itconsulting-heinold.de>
Received: from mail.familie-heinold.de (familie-heinold.de [85.214.48.103])
	by mail.openembedded.org (Postfix) with ESMTP id 0CF616011A
	for <openembedded-devel@lists.openembedded.org>;
	Wed,  4 Jul 2018 10:45:48 +0000 (UTC)
Received: from mail.familie-heinold.de (localhost [127.0.0.1])
	by mail.familie-heinold.de (Postfix) with ESMTP id 2AAAD2E63D9B
	for <openembedded-devel@lists.openembedded.org>;
	Wed,  4 Jul 2018 12:45:49 +0200 (CEST)
Received: from mail.familie-heinold.de (localhost [127.0.0.1])
	by mail.familie-heinold.de (Postfix) with ESMTP id 932232E63D9A
	for <openembedded-devel@lists.openembedded.org>;
	Wed,  4 Jul 2018 12:45:48 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	h873313.serverkompetenz.net
X-Spam-Level: 
X-Spam-Status: No, score=-2.5 required=5.0 tests=ALL_TRUSTED,BAYES_00
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.itconsulting-heinold.de (x4db40c24.dyn.telefonica.de
	[77.180.12.36]) by mail.familie-heinold.de (Postfix) with ESMTPSA
	for <openembedded-devel@lists.openembedded.org>;
	Wed,  4 Jul 2018 12:45:47 +0200 (CEST)
Date: Wed, 4 Jul 2018 12:45:40 +0200
From: Henning Heinold <henning@itconsulting-heinold.de>
To: OpenEmbedded Development mailing list
	<openembedded-devel@lists.openembedded.org>
Message-ID: <20180704104540.GB32590@mail.itconsulting-heinold.de>
References: <CAAfyv37TooGK_RD21SczZmVYpS+-HdE9Yy5KmcuOG9rV2o2LXQ@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CAAfyv37TooGK_RD21SczZmVYpS+-HdE9Yy5KmcuOG9rV2o2LXQ@mail.gmail.com>
User-Agent: Mutt/1.9.4 (2018-02-28)
X-Virus-Scanned: ClamAV using ClamSMTP
Subject: Re: meta-java opnjdk-8 sumo coredump on sumo for BBB
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-devel/>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Wed, 04 Jul 2018 10:45:49 -0000
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Mon, Jul 02, 2018 at 04:10:06PM +0200, Belisko Marek wrote:
> Hello,
> 
> I'm trying to check openjdk-8 for BBB. I compiled it using meta-java
> but when run simple java -version I get:
> 
> root@beaglebone-yocto:~/demo# java -version
> #
> # A fatal error has been detected by the Java Runtime Environment:
> #
> #  Internal Error (os_linux_zero.cpp:254), pid=465, tid=0xb67cc460
> #  fatal error: caught unhandled signal 11
> #
> # JRE version:  (8.0_162-b12) (build )
> # Java VM: OpenJDK Zero VM (25.162-b12 interpreted mode linux-arm )
> # Failed to write core dump. Core dumps have been disabled. To enable
> core dumping, try "ulimit -c unlimited" before starting Java again
> #
> # An error report file with more information is saved as:
> # /home/root/demo/hs_err_pid465.log
> #
> # If you would like to submit a bug report, please visit:
> #   http://bugreport.java.com/bugreport/crash.jsp
> #
> Aborted
> root@beaglebone-yocto:~/demo# uname -a
> Linux beaglebone-yocto 4.15.13-yocto-standard #1 PREEMPT Fri Jun 29
> 22:51:58 UTC 2018 armv7l GNU/Linux
> root@beaglebone-yocto:~/demo#

Sorry I do not know whats going wrong at which level, but you could maybe
ask on the openjdk aarch32 mailinglist.

http://mail.openjdk.java.net/mailman/listinfo/aarch32-port-dev

Bye Henning

