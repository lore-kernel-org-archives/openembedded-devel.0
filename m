Received: from mail-dotnet2.eads.net ([80.156.45.105])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <Wolfgang.Hauser.external@eads.com>)
	id 1Ooab3-0002YH-OZ for openembedded-devel@lists.openembedded.org;
	Thu, 26 Aug 2010 13:26:39 +0200
Received: from unknown (HELO de-gate2.mailhub.intra.corp) ([53.154.243.34])
	by mail-dotnet2.eads.net with ESMTP; 26 Aug 2010 13:21:50 +0200
Received: from gateinet0.mail.ds.corp ([149.207.23.240]) by
	de-gate2.mailhub.intra.corp with Microsoft SMTPSVC(5.0.2195.7381); 
	Thu, 26 Aug 2010 13:25:36 +0200
Received: from deimsg40.de.net.world ([53.141.233.80]) by
	gateinet0.mail.ds.corp with Microsoft SMTPSVC(6.0.3790.4675); 
	Thu, 26 Aug 2010 13:25:36 +0200
X-MimeOLE: Produced By Microsoft Exchange V6.5
MIME-Version: 1.0
Date: Thu, 26 Aug 2010 13:25:34 +0200
Message-ID: <0B51A1E7C61D114DAE6FC10B0FD0ABA5019B4563@deimsg40.de.net.world>
In-Reply-To: <AANLkTikXMR7j0r20XWCdMpDa69P92m6wbPLZVNH_Nob_@mail.gmail.com>
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
Thread-Topic: [oe] Patch procedure for dummies
thread-index: ActEfbakvgowR00QTQG/TDMjOlqvOQAkyb+w
References: <AANLkTikhCMBU=h90KpjDOEMEJgXDqVHdjpcLjdV9xq-s@mail.gmail.com>
	<AANLkTikXMR7j0r20XWCdMpDa69P92m6wbPLZVNH_Nob_@mail.gmail.com>
From: "Hauser, Wolfgang (external)" <Wolfgang.Hauser.external@eads.com>
To: <openembedded-devel@lists.openembedded.org>
X-OriginalArrivalTime: 26 Aug 2010 11:25:36.0289 (UTC)
	FILETIME=[67785110:01CB4511]
X-SA-Exim-Connect-IP: 80.156.45.105
X-SA-Exim-Mail-From: Wolfgang.Hauser.external@eads.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.5 required=5.0 tests=AWL,BAYES_00 autolearn=ham
	version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: Patch procedure for dummies
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
X-List-Received-Date: Thu, 26 Aug 2010 11:26:43 -0000
Content-class: urn:content-classes:message
Content-Type: text/plain;
	charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable

Thanks from me too, but for me it would be helpful to add the necessary =
steps for people which don't have
snmp access for git and have to send patches through the allowed mail =
client as an attachment.

Regards
Wolfgang
=20
-----Urspr=FCngliche Nachricht-----
Von: openembedded-devel-bounces@lists.openembedded.org =
[mailto:openembedded-devel-bounces@lists.openembedded.org] Im Auftrag =
von J. L.=20
Gesendet: Mittwoch, 25. August 2010 19:47
An: openembedded-devel@lists.openembedded.org
Betreff: Re: [oe] Patch procedure for dummies

A huge thanks for taking the time AJ keep you the great work, I am
sure your helping tons of people me included!




On Wed, Aug 25, 2010 at 7:43 AM, AJ ONeal <coolaj86@gmail.com> wrote:
> Please give me feedback and I'll post this on the wiki.
>
> A task-oriented guide to creating a patch:
>
>
>
>> Let's say you create a new recipe and you'd like to submit it for =
inclusion
>> (and you've already tested that it works, of course).
>>
>> 1. Now commit with a good strong helpful message
>>
>> =A0 =A0 git add recipes/nodejs/
>> =A0 =A0 git commit # don't use the -m option
>>
>> 2. The message should look like this
>>
>> =A0 =A0 added recipe for node.js
>>
>> =A0 =A0 * added recipe for node.js (bug #5555 - no nodejs recipe)
>> =A0 =A0 ** patched libev's wscript to not try to execute code
>> =A0 =A0 ** patched node's wscript to not search in '/usr/include'
>>
>> =A0 =A0 Signed-off-by: AJ ONeal <coolaj86@gmail.com>
>>
>> 3. Create your patch
>>
>> =A0 =A0 git format-patch -1 # or however many commits are part of =
this change
>>
>> 3++. If you are submitting a second version also add =
"--subject-prefix
>> [v2]"
>>
>> =A0 =A0 git send-email
>>
>> Your patch will be immediately visible on
>> http://patchwork.openembedded.org/patch/
>>
>
>
>> 4. Once your patch has been accepted or rejected, create an account =
and
>> update the status to "accepted" or "rejected"
>>
>> 4++. If you get soft-rejected (a lot of feedback), make the changes, =
submit
>> the next version, and update the status of the previous patch to
>> "superseded"
>>
>> Appendix: Properly configuring git (using tekkub@gmail.com as an =
example
>> user)
>>
>> =A0 =A0 sudo apt-get install git-core git-email
>> =A0 =A0 git config --global user.name "Tekkub"
>> =A0 =A0 git config --global user.email "tekkub@gmail.com"
>> =A0 =A0 git config --global sendemail.smtpserver smtp.gmail.com
>> =A0 =A0 git config --global sendemail.smtpserverport 587
>> =A0 =A0 git config --global sendemail.smtpencryption tls
>> =A0 =A0 git config --global sendemail.smtpuser tekkupl@gmail.com
>>
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel
>

_______________________________________________
Openembedded-devel mailing list
Openembedded-devel@lists.openembedded.org
http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel


