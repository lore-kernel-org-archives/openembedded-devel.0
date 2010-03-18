Received: from gatekeeper.tait.co.nz ([202.37.96.11])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <douglas.royds@tait.co.nz>) id 1NsMhT-00072Q-T9
	for openembedded-devel@lists.openembedded.org;
	Thu, 18 Mar 2010 21:52:21 +0100
Received: from gatekeeper.tait.co.nz (localhost.localdomain [127.0.0.1])
	by localhost.tait.co.nz (Postfix) with ESMTP id 4EB6146752
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 19 Mar 2010 09:49:24 +1300 (NZDT)
Received: from sunstrike.tait.co.nz (sunstrike [172.25.40.92])
	by gatekeeper.tait.co.nz (Postfix) with ESMTP id 3DF1246749
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 19 Mar 2010 09:49:24 +1300 (NZDT)
Received: from conversion-daemon.sunstrike.tait.co.nz by sunstrike.tait.co.nz
	(Sun Java System Messaging Server 6.1 (built Apr 28 2004))
	id <0KZH00E01V3CSD00@sunstrike.tait.co.nz>
	(original mail from douglas.royds@tait.co.nz)
	for openembedded-devel@lists.openembedded.org; Fri,
	19 Mar 2010 09:49:04 +1300 (NZDT)
Received: from [172.25.116.17] by sunstrike.tait.co.nz
	(Sun Java System Messaging Server 6.1 (built Apr 28 2004))
	with ESMTP id <0KZH0089TWHNOB60@sunstrike.tait.co.nz> for
	openembedded-devel@lists.openembedded.org; Fri,
	19 Mar 2010 09:49:01 +1300 (NZDT)
Date: Fri, 19 Mar 2010 09:48:59 +1300
From: Douglas Royds <douglas.royds@tait.co.nz>
In-reply-to: <ac9c93b11003180018u761e78f6l67b3f76869a95612@mail.gmail.com>
To: openembedded-devel@lists.openembedded.org
Message-id: <4BA291BB.7040106@tait.co.nz>
MIME-version: 1.0
References: <4BA1B29B.8040704@tait.co.nz>
	<ac9c93b11003180018u761e78f6l67b3f76869a95612@mail.gmail.com>
User-Agent: Thunderbird 2.0.0.23 (X11/20090817)
X-SA-Exim-Connect-IP: 202.37.96.11
X-SA-Exim-Mail-From: douglas.royds@tait.co.nz
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=AWL,BAYES_00 autolearn=ham
	version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: [PATCH 4/4] Renamed prefix_native, bindir_native, etc using 	hyphens
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
X-List-Received-Date: Thu, 18 Mar 2010 20:52:21 -0000
Content-type: text/plain; format=flowed; charset=ISO-8859-1
Content-transfer-encoding: 7BIT

Frans Meulenbroeks wrote:
> 2010/3/18 Douglas Royds <douglas.royds@tait.co.nz>:
>   
>>   - Avoids clashing with the machine override when MACHINE=native
>>   - bindir_cross similarly renamed for consistency
>>
>>     
> [...]
>   
>>  # Path prefixes
>>  base_prefix = "${STAGING_DIR_NATIVE}"
>> -prefix = "${STAGING_DIR_NATIVE}${prefix_native}"
>> -exec_prefix = "${STAGING_DIR_NATIVE}${prefix_native}"
>> +prefix = "${STAGING_DIR_NATIVE}${prefix-native}"
>> +exec_prefix = "${STAGING_DIR_NATIVE}${prefix-native}"
>>     
>
> [...]
>
> Shouldn't we then for consistent naming also go to exex-prefix etc ?

In the spirit of keeping a single patch for a single purpose, I have not 
modified anything that is not required to fix the problem at hand (um, 
except for bindir_cross). I have only modified the variable names that 
were modified in Richard's commit "Start removal of layout_* variables 
and replace these with new mechanisms to allow nextgen SDK generation 
(from Poky)":

    http://cgit.openembedded.org/cgit.cgi/openembedded/commit/?id=bea72c2fecde175add169bb55df1922b048030c8

Any renaming of base_prefix, exec_prefix, base_bindir, target_datadir, 
&c is a separate matter. Note that some of these names are imposed on us 
by Autotools convention. This is why these variables are in lower case 
in the first place:

    http://www.gnu.org/prep/standards/html_node/Directory-Variables.html#Directory-Variables

Douglas.

=======================================================================
This email, including any attachments, is only for the intended
addressee.  It is subject to copyright, is confidential and may be
the subject of legal or other privilege, none of which is waived or
lost by reason of this transmission.
If the receiver is not the intended addressee, please accept our
apologies, notify us by return, delete all copies and perform no
other act on the email.
Unfortunately, we cannot warrant that the email has not been
 altered or corrupted during transmission.
=======================================================================



