Received: from [213.91.4.211] (helo=bart.wifirst.net)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <adrien.demarez@bolloretelecom.eu>)
	id 1Lozxt-0001kt-7P for openembedded-devel@lists.openembedded.org;
	Wed, 01 Apr 2009 14:54:45 +0200
Received: from bart.wifirst.net (localhost [127.0.0.1])
	by bart.wifirst.net (Postfix) with ESMTP id BECD35FF26;
	Wed,  1 Apr 2009 14:52:24 +0200 (CEST)
Received: from bart.wifirst.net (localhost [127.0.0.1])
	by bart.wifirst.net (Postfix) with ESMTP id EBE8F5FF27;
	Wed,  1 Apr 2009 14:52:22 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.2.3 (2007-08-08) on bart
X-Spam-Level: 
X-Spam-Status: No, score=-1.5 required=5.0 tests=AWL,BAYES_00 autolearn=ham
	version=3.2.3
Received: from blini.bolloretelecom.eu (smtp.bolloretelecom.eu
	[62.210.194.121])
	by bart.wifirst.net (Postfix) with ESMTP id 87B955FF26;
	Wed,  1 Apr 2009 14:52:22 +0200 (CEST)
Received: from [192.168.95.152] (unknown [192.168.95.152])
	by blini.bolloretelecom.eu (Postfix) with ESMTPSA id 55CB523E44;
	Wed,  1 Apr 2009 14:52:22 +0200 (CEST)
Message-ID: <49D363A5.3010503@bolloretelecom.eu>
Date: Wed, 01 Apr 2009 14:52:53 +0200
From: Adrien Demarez <adrien.demarez@bolloretelecom.eu>
User-Agent: Thunderbird 2.0.0.21 (X11/20090302)
MIME-Version: 1.0
To: mwester@dls.net
References: <49D245F0.4060107@dls.net>
In-Reply-To: <49D245F0.4060107@dls.net>
X-Enigmail-Version: 0.95.7
X-Virus-Scanned: ClamAV using ClamSMTP
Cc: openembedded-devel@openembedded.org,
	openembedded-devel@lists.openembedded.org
Subject: Re: madwifi-ng & linux 2.6.29
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
X-List-Received-Date: Wed, 01 Apr 2009 12:54:45 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

Hi all,

I am working with Jeremy Lain=E9 on the boc01 architecture. Currently, we
do use Madwifi + hostapd 0.5 for our 11g Atheros minicard modules
(despite we want to switch to ath9k / ath5k when it is mature enough).
As we are still using 2.6.27 kernel and found ath9k is not mature enough
for AP in this version (at least, it does not work with our AR9160
modules), I have written a working recipe for compat-wireless (not yet
committed into OE though, please tell if anyone is interested. Beware :
it does not compile if MAC80211 or CFG80211 is defined as 'y' in the
kernel, use 'm' or 'n' instead !).
This is working, though I'd prefer using vanilla in-kernel drivers
instead of compat-wireless (so I plan to have a look to ath*k in 2.6.29
kernel very soon).

In order to use ath*k (or any drivers using nl80211) with hostapd, I
have also written a recipe for hostapd-0.6.9 (Jeremy has uploaded it
into OE) and this is working perfectly with our AR9160 modules using
ath9k from compat-wireless. I am currently testing ath5k, but I run into
a few troubles with AP mode, so until this is fixed we still need to
keep a working madwifi+hostapd-0.5.10 (I also experienced a few troubles
with madwifi + hostapd-0.6.9 so for the moment we stand with hostapd-0.5
when using madwifi, and hostapd-0.6 is not set as the default one. I
will look at this soon but getting a working ath5k/AP is more important
to me currently).
I also have to do more testing with wpa_supplicant (currently, AP mode
is my focus).

BTW, if anyone is interested, I also have written a working recipe for
madwifi using hal-0.10.5.6. I found this hal is necessary for some
recent chips like AR2417 with whom the vanilla madwifi-ng driver does
not work.

Best regards,

--
Adrien Demarez

Mike (mwester) a =E9crit :
> Now that the 2.6.29 kernel has support for some of the Atheros wifi
> devices, we have a little bit of a problem.  The solution would seem to
> me to be to virtualize atheros support in OE.  This would change a
> number of recipes, including hostap-daemon, wpa-supplicant, and a bunch
> of package and task recipes.
>
> This assumes that hostap-daemon and wpa-supplicant won't need other
> changes to support the new drivers...
>
> So the first question to the group is who uses madwifi anymore?  SlugOS
> includes drivers, but only for selected (and unusual) devices, so fixin=
g
> this is not a high priority for SlugOS, nor is maintaining compatibilit=
y
> a big concern for SlugOS, I think.   Anyone else?
>
> Mike (mwester)
>
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel
>  =20

--=20

Adrien Demarez
Bollor=E9 telecom
>> WiMAX is here and across Europe! See us @
http://www.wimaxoperators.org/regional/europe

Bureaux/Office : 11bis, rue Scribe | F-75009 Paris
Tel : +33 1 78 14 04 08
www.bolloretelecom.eu <http://www.bolloretelecom.eu>

------------------------------------------------------------------------

Ce message et toutes les pi=E8ces jointes (ci-apr=E8s le =AB message =BB)=
 sont
=E9tablis =E0 l'intention exclusive de ses destinataires et sont
confidentiels. Si vous recevez ce message par erreur, merci de le
d=E9truire et d'en avertir imm=E9diatement l'exp=E9diteur. Toute utilisat=
ion
de ce message non conforme =E0 sa destination, toute diffusion ou toute
publication, totale ou partielle, est interdite, sauf autorisation
expresse. L'Internet ne permettant pas d'assurer l'int=E9grit=E9 de ce
message, Bollor=E9 telecom d=E9cline toute responsabilit=E9 au titre de c=
e
message, dans l'hypoth=E8se o=F9 il aurait =E9t=E9 modifi=E9.

------------------------------------------------------------------------


