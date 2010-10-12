Received: from smtp2.nedap.com ([213.160.213.92] helo=smtp.nedap.com)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <jaap.dejong@nedap.com>) id 1P5dWE-0008Bc-Q7
	for openembedded-devel@lists.openembedded.org;
	Tue, 12 Oct 2010 13:59:48 +0200
Received: from nvs0066.nedap.local ([10.91.8.1]) by smtp.nedap.com with
	Microsoft SMTPSVC(6.0.3790.1830); Tue, 12 Oct 2010 13:59:31 +0200
X-TM-IMSS-Message-ID: <0c1c8a6700003d4e@nedap.com>
Received: from [10.2.40.10] ([10.2.40.10]) by nedap.com ([10.91.8.1]) with
	ESMTP (TREND IMSS SMTP Service 7.0) id 0c1c8a6700003d4e for
	<jaap.dejong@nedap.com>; Tue, 12 Oct 2010 13:59:20 +0100
Message-ID: <4CB44DA2.5040003@nedap.com>
Date: Tue, 12 Oct 2010 13:59:30 +0200
From: Jaap de Jong <jaap.dejong@nedap.com>
User-Agent: Mozilla/5.0 (X11; U; Linux i686; en-US;
	rv:1.9.1.12) Gecko/20100915 Lightning/1.0b1 Thunderbird/3.0.8
MIME-Version: 1.0
To: openembedded-devel@lists.openembedded.org
References: <4CB4391E.6030909@cam.ac.uk>
In-Reply-To: <4CB4391E.6030909@cam.ac.uk>
X-OriginalArrivalTime: 12 Oct 2010 11:59:31.0861 (UTC)
	FILETIME=[EE2E3450:01CB6A04]
X-SA-Exim-Connect-IP: 213.160.213.92
X-SA-Exim-Mail-From: jaap.dejong@nedap.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=AWL,BAYES_00 autolearn=ham
	version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: testing branch 2010-10-08: Udev 151 issues.
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
X-List-Received-Date: Tue, 12 Oct 2010 11:59:49 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

Adding

     CFLAGS_append = " -Os"

helps (has been in the mailinglist some days ago)

Jaap



On 10/12/2010 12:31 PM, Jonathan Cameron wrote:
> Hi All,
>
> I'm getting,
>
> NOTE: make
> mkdir -p extras/keymap
>    GEN    extras/keymap/keys.txt
>    GEN    extras/keymap/keys-from-name.gperf
>    GEN    extras/keymap/keys-from-name.h
>    GEN    extras/keymap/keys-to-name.h
> make --no-print-directory all-recursive
> Making all in .
>    CC     libudev/libudev.lo
>    CC     libudev/libudev-list.lo
>    CC     libudev/libudev-util.lo
>    CC     libudev/libudev-device.lo
>    CC     libudev/libudev-enumerate.lo
>    CC     libudev/libudev-monitor.lo
>    CC     libudev/libudev-queue.lo
> libudev/libudev-queue.c: In function 'udev_queue_skip_devpath':
> libudev/libudev-queue.c:185:1: internal compiler error: in cond_exec_process_insns, at ifcvt.c:273
> Please submit a full bug report,
> with preprocessed source if appropriate.
> See<http://gcc.gnu.org/bugs.html>  for instructions.
> make[2]: *** [libudev/libudev-queue.lo] Error 1
> make[1]: *** [all-recursive] Error 1
> make: *** [all] Error 2
> FATAL: oe_runmake failed
>
>
> in udev 151 and have been since 2010-10-04 (worked previously though I guess udev may
> have changed).
>
> Building imote2-image
>
> MACHINE = "imote2"
> DISTRO = "angstrom-2010.x"
>
> Anyone seeing anything similar?
>
> Jonathan
>
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel
>    


