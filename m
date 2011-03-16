Received: from relay1.mentorg.com ([192.94.38.131])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <Tom_Rini@mentor.com>) id 1Pzyo1-0001rV-TV
	for openembedded-devel@lists.openembedded.org;
	Wed, 16 Mar 2011 23:03:02 +0100
Received: from svr-orw-exc-10.mgc.mentorg.com ([147.34.98.58])
	by relay1.mentorg.com with esmtp 
	id 1PzymN-0002AO-JH from Tom_Rini@mentor.com 
	for openembedded-devel@lists.openembedded.org;
	Wed, 16 Mar 2011 15:01:19 -0700
Received: from SVR-ORW-FEM-04.mgc.mentorg.com ([147.34.97.41]) by
	SVR-ORW-EXC-10.mgc.mentorg.com with Microsoft
	SMTPSVC(6.0.3790.4675); Wed, 16 Mar 2011 15:00:57 -0700
Received: from [172.30.80.14] (147.34.91.1) by svr-orw-fem-04.mgc.mentorg.com
	(147.34.97.41) with Microsoft SMTP Server id 14.1.270.1;
	Wed, 16 Mar 2011 15:01:18 -0700
Message-ID: <4D81331E.2070604@mentor.com>
Date: Wed, 16 Mar 2011 15:01:02 -0700
From: Tom Rini <tom_rini@mentor.com>
Organization: Mentor Graphics Corporation
User-Agent: Mozilla/5.0 (X11; U; Linux i686; en-US;
	rv:1.9.2.14) Gecko/20110223 Lightning/1.0b2 Thunderbird/3.1.8
MIME-Version: 1.0
To: <openembedded-devel@lists.openembedded.org>
References: <4D81226B.4060704@gmail.com>
In-Reply-To: <4D81226B.4060704@gmail.com>
X-OriginalArrivalTime: 16 Mar 2011 22:00:57.0412 (UTC)
	FILETIME=[A0DF9040:01CBE425]
Subject: Re: perl-native_5.10.1 fails
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
X-List-Received-Date: Wed, 16 Mar 2011 22:03:02 -0000
Content-Type: text/plain; charset="ISO-8859-1"; format=flowed
Content-Transfer-Encoding: 7bit

On 03/16/2011 01:49 PM, Jan Paesmans wrote:
> Hi all,
>
> When trying to build an x11-image for pm9263 with angstrom-2010.x,
> perl-native fails to build.
> The error is listed below. As far as I can tell, the problem is that a
> gcc flag is passed to the linker, -fstack-protector. I tried to find out
> where this -fstack-protector could come from, but the only trace I could
> find was in the Configure of perl-native itself. There is no mention
> that it is set when Configure is called in the configure step, nor in
> any of the environment variables during the do_configure or do_compile step.
>
> I run Ubuntu 10.10 with gold as the linker. I thought that it might be
> the gold linker but neither gold nor ld seem to have this option when
> reviewing the man-page.

Can you edit the recipe and add in:
EXTRA_OEMAKE = 'LD="${CCLD}"'

And do a bitbake -c clean perl-native then bitbake perl-native
Thanks.

-- 
Tom Rini
Mentor Graphics Corporation


