Received: from lo.gmane.org ([80.91.229.12])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <gcho-openembedded-devel@m.gmane.org>)
	id 1Qlnc8-0004oO-4T for openembedded-devel@lists.openembedded.org;
	Tue, 26 Jul 2011 21:48:24 +0200
Received: from list by lo.gmane.org with local (Exim 4.69)
	(envelope-from <gcho-openembedded-devel@m.gmane.org>)
	id 1QlnY3-0007Ov-J8 for openembedded-devel@lists.openembedded.org;
	Tue, 26 Jul 2011 21:44:11 +0200
Received: from ip545070eb.adsl-surfen.hetnet.nl ([84.80.112.235])
	by main.gmane.org with esmtp (Gmexim 0.1 (Debian))
	id 1AlnuQ-0007hv-00 for <openembedded-devel@lists.openembedded.org>;
	Tue, 26 Jul 2011 21:44:11 +0200
Received: from koen by ip545070eb.adsl-surfen.hetnet.nl with local (Gmexim 0.1
	(Debian)) id 1AlnuQ-0007hv-00
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 26 Jul 2011 21:44:11 +0200
X-Injected-Via-Gmane: http://gmane.org/
To: openembedded-devel@lists.openembedded.org
From: Koen Kooi <koen@dominion.thruhere.net>
Date: Tue, 26 Jul 2011 21:43:55 +0200
Message-ID: <j0n5dr$561$1@dough.gmane.org>
References: <1311017115-28352-1-git-send-email-ray.danks@se-eng.com>	<1311018697.20601.2.camel@mattotaupa>	<1311019495.20601.13.camel@mattotaupa>
	<1311198469.6129.16.camel@mattotaupa> <4E2F02D8.4030002@se-eng.com>
Mime-Version: 1.0
X-Complaints-To: usenet@dough.gmane.org
X-Gmane-NNTP-Posting-Host: ip545070eb.adsl-surfen.hetnet.nl
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.7;
	rv:5.0) Gecko/20110624 Thunderbird/5.0
In-Reply-To: <4E2F02D8.4030002@se-eng.com>
X-Enigmail-Version: 1.2
Subject: Re: calibrator: also problems with <svn://svn.bec-systems.com/>
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
X-List-Received-Date: Tue, 26 Jul 2011 19:48:24 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA1

Op 26-07-11 20:09, Raymond Danks schreef:
> I apologize Paul - I did something with my email filters and missed this.  You are correct; the URL is wrong in this patch.  The correct URL is: http://svn.bec-systems.com/pub/calibrator/
> 
> No - I don't have rights yet.  How do I go about getting commit rights?

Technically you still have them since you had monotone access :) I think nowadays you send your ssh key to cliff + khem and they'll sort it out.

> 
> I'm following up on this and the other comments today.
> 
> Thanks, Ray
> 
> On 07/20/2011 03:47 PM, Paul Menzel wrote:
>> Dear Raymond,
>> 
>> 
>> Am Montag, den 18.07.2011, 22:04 +0200 schrieb Paul Menzel:
>> 
>>> Am Montag, den 18.07.2011, 21:51 +0200 schrieb Paul Menzel:
>>>> Am Montag, den 18.07.2011, 13:25 -0600 schrieb Raymond Danks:
>>>>> * The SVN repository for this project has changed URI.
>> actually testing your patch I am experiencing the following problem with task fetch.
>> 
>> svn: OPTIONS of 'http://svn.bec-systems.com/svn/pub/calibrator': authorization failed: Could not authenticate to server: rejected Basic challenge (http://svn.bec-systems.com) NOTE: package calibrator-0.9e+svnr21-r0: task Fetch failed: Unable to fetch URL
>> svn://svn.bec-systems.com/svn/pub;module=calibrator;proto=http from any source.: Failed ERROR: Function 'Fetch failed: Unable to fetch URL svn://svn.bec-systems.com/svn/pub;module=calibrator;proto=http from any source.' failed
>> 
>>>>> * Upgrade to and patch the latest version for use with current tools.
>>> actually thinking about this, two patches would have been better. I will split this patch up.
>>> 
>>>>> Signed-off-by: Raymond Danks<ray.danks@se-eng.com> --- recipes/calibrator/calibrator_svn.bb               |    6 +- .../calibrator/files/round_conflicting_types.patch |   91 ++++++++++++++++++++ 2 files changed, 95 insertions(+), 2 deletions(-) create mode 100644
>>>>> recipes/calibrator/files/round_conflicting_types.patch
>>>>> 
>>>>> diff --git a/recipes/calibrator/calibrator_svn.bb b/recipes/calibrator/calibrator_svn.bb index bd7bb1f..60eeaf9 100644 --- a/recipes/calibrator/calibrator_svn.bb +++ b/recipes/calibrator/calibrator_svn.bb @@ -2,11 +2,13 @@ DESCRIPTION = "The Calibrator, a Cache-Memory and TLB Calibration
>>>>> Tool" HOMEPAGE = "http://monetdb.cwi.nl/Calibrator/" LICENSE = "AS IS"
>>>>> 
>>>>> -SRCREV = "21" +SRCREV = "138" PV = "0.9e+svnr${SRCPV}" PR = "r0"
>>>>> 
>>>>> -SRC_URI = "svn://dev.bec-systems.com/svn/pub;module=calibrator;proto=http" +SRC_URI = "\ +    svn://svn.bec-systems.com/pub;module=calibrator;proto=http \ +    file://round_conflicting_types.patch"
>>>> Maybe also put the last " on a new line to make future diffs smaller?
>>>> 
>>>>> inherit autotools
>>>>> 
>>>>> diff --git a/recipes/calibrator/files/round_conflicting_types.patch b/recipes/calibrator/files/round_conflicting_types.patch new file mode 100644 index 0000000..520c945 --- /dev/null +++ b/recipes/calibrator/files/round_conflicting_types.patch @@ -0,0 +1,91 @@ +round is a conflicting type
>>>>> ; rename to custom_round instead.
>>>> Did you send that patch upstream?
>>>> 
>>>>> + +diff -urN calibrator.orig/calibrator.c calibrator/calibrator.c +--- calibrator.orig/calibrator.c    2011-07-11 16:40:32.000000000 -0600 ++++ calibrator/calibrator.c    2011-07-11 16:44:22.333626120 -0600 +@@ -128,7 +128,7 @@
>>>> […]
>>>> 
>>>> Acked-by: Paul Menzel<paulepanter@users.sourceforge.net>
>>> I forgot to ask, do you have write/commit access to the Git repository?
>> 
>> Thanks,
>> 
>> Paul
>> 
>> 
>> _______________________________________________ Openembedded-devel mailing list Openembedded-devel@lists.openembedded.org http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel
> 
> _______________________________________________ Openembedded-devel mailing list Openembedded-devel@lists.openembedded.org http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.5 (Darwin)

iD8DBQFOLxj7MkyGM64RGpERAgoYAJkBqgcN+ORwAy5auUY8zCP1UeE1mQCgsBs6
gqgy7B3i/IiLGO+l1NJDFl8=
=KyIu
-----END PGP SIGNATURE-----



