Received: from gatekeeper.tait.co.nz ([202.37.96.11])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <douglas.royds@tait.co.nz>) id 1NsMqE-00085C-5c
	for openembedded-devel@lists.openembedded.org;
	Thu, 18 Mar 2010 22:01:39 +0100
Received: from gatekeeper.tait.co.nz (localhost.localdomain [127.0.0.1])
	by localhost.tait.co.nz (Postfix) with ESMTP id 215D446754
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 19 Mar 2010 09:58:33 +1300 (NZDT)
Received: from sunstrike.tait.co.nz (sunstrike [172.25.40.92])
	by gatekeeper.tait.co.nz (Postfix) with ESMTP id 0DF4446752
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 19 Mar 2010 09:58:33 +1300 (NZDT)
Received: from conversion-daemon.sunstrike.tait.co.nz by sunstrike.tait.co.nz
	(Sun Java System Messaging Server 6.1 (built Apr 28 2004))
	id <0KZH00E01V3CSD00@sunstrike.tait.co.nz>
	(original mail from douglas.royds@tait.co.nz)
	for openembedded-devel@lists.openembedded.org; Fri,
	19 Mar 2010 09:58:13 +1300 (NZDT)
Received: from [172.25.116.17] by sunstrike.tait.co.nz
	(Sun Java System Messaging Server 6.1 (built Apr 28 2004))
	with ESMTP id <0KZH008I5WX1OB60@sunstrike.tait.co.nz> for
	openembedded-devel@lists.openembedded.org; Fri,
	19 Mar 2010 09:58:13 +1300 (NZDT)
Date: Fri, 19 Mar 2010 09:58:13 +1300
From: Douglas Royds <douglas.royds@tait.co.nz>
In-reply-to: <1268933342.8697.43.camel@rex>
To: openembedded-devel@lists.openembedded.org
Message-id: <4BA293E5.9030705@tait.co.nz>
MIME-version: 1.0
References: <4BA1825F.9080405@tait.co.nz> <1268933342.8697.43.camel@rex>
User-Agent: Thunderbird 2.0.0.23 (X11/20090817)
X-SA-Exim-Connect-IP: 202.37.96.11
X-SA-Exim-Mail-From: douglas.royds@tait.co.nz
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=BAYES_00 autolearn=ham
	version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: [PATCH 2/2] Renamed prefix_native, bindir_native, etc using camelCaps
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
X-List-Received-Date: Thu, 18 Mar 2010 21:01:39 -0000
Content-type: text/plain; format=flowed; charset=ISO-8859-1
Content-transfer-encoding: 7BIT

Richard Purdie wrote:
> On Thu, 2010-03-18 at 04:37 +0100, Holger Hans Peter Freyther wrote:
>   
>> On Thursday 18 March 2010 02:31:11 Douglas Royds wrote:
>>     
>>>     - Avoids clashing with the machine override when MACHINE=native
>>>     - bindir_cross similarly renamed for consistency
>>>       
>> Thank you for that much work. I think we established the usage of '-' instead 
>> of '_' to avoid clashes with the override detection though.
>>     
>
> I just noticed this problem. It makes me very very nervous to introduce
> yet another variable naming convention, particularly one we don't use
> anywhere else :/.
>
> Might it be simpler to rename the native machine? Using "native" in the
> override namespace is asking for trouble :(.

I have no objection to renaming the native machine, but I think we 
should also ensure that we never use _thing variable names (in lower 
case). We have a weak distinction between overrides and underscored 
variable names. By convention, BitBake variables are entirely in 
uppercase, and overrides in lower case, but this convention fails when 
the variable names are externally imposed (by the Autotools), 
exec_prefix being a case in point.

I propose that we rename prefix_native and friends to avoid any risk of 
clashing with the overrides.

Separately, if we wish, we can rename the native machine. I suggest 
"buildhost". This would also help to clarify that the following two 
builds have quite different intentions, though the result is similar:

    bitbake thing-native
    MACHINE=native bitbake thing

Douglas






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



