Return-Path: <blloyd@familyhonor.net>
X-Greylist: delayed 2304 seconds by postgrey-1.34 at layers.openembedded.org;
	Fri, 03 Oct 2014 00:42:53 UTC
Received: from mho-02-ewr.mailhop.org (mho-02-ewr.mailhop.org [204.13.248.72])
	by mail.openembedded.org (Postfix) with ESMTP id E56DA601A8
	for <openembedded-devel@lists.openembedded.org>;
	Fri,  3 Oct 2014 00:42:53 +0000 (UTC)
Received: from dynamic30-98-142-75.dobsonteleco.com ([98.142.75.30]
	helo=lloydserv.home.familyhonor.net)
	by mho-02-ewr.mailhop.org with esmtpsa (TLSv1:AES256-SHA:256)
	(Exim 4.72) (envelope-from <blloyd@familyhonor.net>)
	id 1XZqMI-0003wD-SO; Fri, 03 Oct 2014 00:04:30 +0000
Received: from mail.familyhonor.net (lloydserv.home.familyhonor.net
	[127.0.0.1]) (authenticated bits=0)
	by lloydserv.home.familyhonor.net (8.14.7/8.14.6) with ESMTP id
	s9304S1W005723
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO);
	Thu, 2 Oct 2014 19:04:29 -0500
X-Mail-Handler: Dyn Standard SMTP by Dyn
X-Originating-IP: 98.142.75.30
X-Report-Abuse-To: abuse@dyndns.com (see
	http://www.dyndns.com/services/sendlabs/outbound_abuse.html for
	abuse reporting information)
X-MHO-User: U2FsdGVkX1/N5DvL701/BkAIBU3QuGCiHVTObE4HH+k=
MIME-Version: 1.0
Date: Thu, 02 Oct 2014 19:04:28 -0500
From: blloyd <blloyd@familyhonor.net>
To: Otavio Salvador <otavio@ossystems.com.br>
In-Reply-To: <CAP9ODKoNT2hwQ+a-ynCbCHXDLnE38XPvcY7=Q5AQtKMwpcEZwA@mail.gmail.com>
References: <1402343170-17707-1-git-send-email-blloyd@familyhonor.net>
	<20141002062154.GG25706@jama>
	<CAP9ODKoNT2hwQ+a-ynCbCHXDLnE38XPvcY7=Q5AQtKMwpcEZwA@mail.gmail.com>
Message-ID: <d1c3c423c04a32e16ceb3c0eba976204@mail.familyhonor.net>
X-Sender: blloyd@familyhonor.net
User-Agent: Roundcube Webmail/0.9.5
Cc: otavio.salvador@gmail.com,
	OpenEmbedded Devel List <openembedded-devel@lists.openembedded.org>
Subject: Re: [meta-oe][PATCH] Upgrade geode video driver to 2.11.15
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
X-List-Received-Date: Fri, 03 Oct 2014 00:42:59 -0000
Content-Type: text/plain; charset=UTF-8;
 format=flowed
Content-Transfer-Encoding: 7bit

On 2014-10-02 12:37, Otavio Salvador wrote:
> On Thu, Oct 2, 2014 at 3:21 AM, Martin Jansa <martin.jansa@gmail.com> 
> wrote:
>> On Mon, Jun 09, 2014 at 02:46:10PM -0500, Brian Lloyd wrote:
>>> From: blloyd <blloyd@familyhonor.net>
>>> 
>>> The latest driver corrected a number of issues and compiles without 
>>> warnings with just one patch.  The header included by the given patch 
>>> is already included in the geode master line, so will not be be 
>>> required after the next geode version release.
>> 
>> xf86-video-geode is broken again, would you mind fixing it to build 
>> with
>> glibc-2.20?
>> 
>> |                  from 
>> /home/jenkins/oe/world/shr-core/tmp-glibc/work/i586-oe-linux/xf86-video-geode/2_2.11.16-r21.0/xf86-video-geode-2.11.16/src/lx_memory.c:26:
>> | 
>> /home/jenkins/oe/world/shr-core/tmp-glibc/sysroots/qemux86/usr/include/xorg/os.h:579:1: 
>> error: expected identifier or '(' before '__extension__'
>> |  strndup(const char *str, size_t n);
>> |  ^
> 
> I am not using it anymore so it'd be great if Brian could handle it.

Was already working on it.  My patch has already been accepted upstream 
for 2.11.17.
I'll get a patch for yocto 2.11.16 to use until 2.11.17 is released, as 
that is probably a very long way away.

In the meantime, add

#if HAVE_CONFIG_H
#include <config.h>
#endif

to the top of the file and it compiles if you need it.  I'm having 
issues with my dev box and didn't get the yocto patch out.  I should be 
able to get it out this weekend if I don't get it out before.



