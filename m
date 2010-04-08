Received: from lo.gmane.org ([80.91.229.12])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <gcho-openembedded-devel@m.gmane.org>)
	id 1NzoVE-0005q5-3p for openembedded-devel@lists.openembedded.org;
	Thu, 08 Apr 2010 11:58:50 +0200
Received: from list by lo.gmane.org with local (Exim 4.69)
	(envelope-from <gcho-openembedded-devel@m.gmane.org>)
	id 1NzoRz-0006wd-Ay for openembedded-devel@lists.openembedded.org;
	Thu, 08 Apr 2010 11:55:03 +0200
Received: from s55917625.adsl.wanadoo.nl ([85.145.118.37])
	by main.gmane.org with esmtp (Gmexim 0.1 (Debian))
	id 1AlnuQ-0007hv-00 for <openembedded-devel@lists.openembedded.org>;
	Thu, 08 Apr 2010 11:55:03 +0200
Received: from k.kooi by s55917625.adsl.wanadoo.nl with local (Gmexim 0.1
	(Debian)) id 1AlnuQ-0007hv-00
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 08 Apr 2010 11:55:03 +0200
X-Injected-Via-Gmane: http://gmane.org/
To: openembedded-devel@lists.openembedded.org
From: Koen Kooi <k.kooi@student.utwente.nl>
Date: Thu, 08 Apr 2010 11:54:37 +0200
Message-ID: <hpk94t$lgd$2@dough.gmane.org>
References: <20100403171724.b9df4c84.ospite@studenti.unina.it>	<201004032017.10514.marcin@juszkiewicz.com.pl>	<20100406115837.fde46160.ospite@studenti.unina.it>
	<20100408112243.f558a240.ospite@studenti.unina.it>
Mime-Version: 1.0
X-Complaints-To: usenet@dough.gmane.org
X-Gmane-NNTP-Posting-Host: s55917625.adsl.wanadoo.nl
User-Agent: Mozilla/5.0 (Macintosh; U; Intel Mac OS X 10.6; en-US;
	rv:1.9.1.9) Gecko/20100329 Shredder/3.0.5pre
In-Reply-To: <20100408112243.f558a240.ospite@studenti.unina.it>
X-Enigmail-Version: 1.0.1
X-SA-Exim-Connect-IP: 80.91.229.12
X-SA-Exim-Mail-From: gcho-openembedded-devel@m.gmane.org
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.4 required=5.0 tests=AWL,BAYES_00,SPF_HELO_PASS,
	SPF_PASS autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: gtk+-native-2.20.0-r8.0 fails in do_configure.
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
X-List-Received-Date: Thu, 08 Apr 2010 09:58:51 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA1

On 08-04-10 11:22, Antonio Ospite wrote:
> On Tue, 6 Apr 2010 11:58:37 +0200
> Antonio Ospite <ospite@studenti.unina.it> wrote:
> 
>> On Sat, 3 Apr 2010 20:17:09 +0200
>> Marcin Juszkiewicz <marcin@juszkiewicz.com.pl> wrote:
>>
>>> Dnia sobota, 3 kwietnia 2010 o 17:17:24 Antonio Ospite napisał(a):
>>>> when building gtk+-native-2.20.0-r8.0 (actually bitbaking
>>>> fso-console-image DISTRO=minimal MACHINE=a780) I get this message:
>>>>
>>>>  Requested 'glib-2.0 >= 2.23.6' but version of GLib is 2.22.1
>>>>
>>>> See also http://tinderbox.openembedded.org/packages/540390/
>>>>
>>>> I can workaround that locally but I would like to learn what the best
>>>> way to solve such issues would be. I don't see any
>>>> preferred-minimal-versions.inc
>>>
>>> Recent glib-2.0 recipes has BBCLASSEXTEND = "native" set but we also have 
>>> glib-2.0-native recipes... I think that native ones should be dropped.
>>>
>>
>> So what is happening to me now it that glib-2.0-native_2.22.1.bb gets
>> selected and the more recent ones with BBCLASSEXTEND = "native" are
>> discarded, right?
>>
> 
> Ok, I confirm this was actually the case, the old way to do native
> recipes seems to have precedence on the new one, this is with bitbake
> 1.8.18, don't know if that is dependent on bitbake version tho.
> 
> Removing all glib-2.0-native packages makes gtk+-native-2.20.0-r8.0
> build ok.
> 
>> If the -native recipes are going to be dropped should the
>> BBCLASSEXTEND mechanism moved to some glib*.inc file?
>>
> 
> Should I just send a patch which blindly removes native
> recipes for older versions, or try to port the BBCLASSEXTEND mechanism
> to them? I don't know if I am fully comfortable with such changes in OE,
> but I can always send a tentative patch.

Porting them has a slight preference over deleting them. The -native
recipes shouldn't be needed for things like maemo-compat, hence the
'slight' :)

regards,

Koen
-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.5 (Darwin)

iD8DBQFLvafcMkyGM64RGpERAroAAKCW7+h5AKr8VHhjoowsODwbKdX/+wCglfaW
vf+ofTWZVrCCpZzw6mNyL/8=
=BaGg
-----END PGP SIGNATURE-----



