Received: from [209.85.219.221] (helo=mail-ew0-f221.google.com)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <andrea.adami@gmail.com>) id 1MePSF-0004IT-43
	for openembedded-devel@lists.openembedded.org;
	Fri, 21 Aug 2009 10:26:35 +0200
Received: by ewy21 with SMTP id 21so530965ewy.21
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 21 Aug 2009 01:09:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:received:in-reply-to:references
	:date:message-id:subject:from:to:content-type
	:content-transfer-encoding;
	bh=qV5kYHVytUnlv57aX3s+VIGiD8MdjsjeaHuZjkfneBQ=;
	b=f+5ChEJ6wtvOIiwSiajlsvTBH7ObjdQSGDLZGjYq6r4V+JAoyD9EXcm04v+vPfurZA
	OsSVu1o+OQSV63BqbuM7j5elOlZnoZQYQVloEsWcddtZwSEzq5KwMK4WaRBeP/01VB43
	3drXWeUNwBy/r6Xdm5AsWEuqKsAJaHXog9KxI=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type:content-transfer-encoding;
	b=UWAgLbGhr4h8VL03yFD5iWt3aT3Oy/x/p8mvjN/YevwdiyBIssAbUDPTAxeXfmNS/7
	TH/v4frC27gqauPMIBYbn18ulXvLaM47ZoIWBSjW4wWTBKySoRzBaWuUw4MfAzxKqnc8
	33w51Ld/sIDKIEd9YcSuCtVIuS9JEp8Yhikk0=
MIME-Version: 1.0
Received: by 10.216.86.1 with SMTP id v1mr147671wee.97.1250842150772; Fri, 21 
	Aug 2009 01:09:10 -0700 (PDT)
In-Reply-To: <d1b08f940908151449x3365f27cl5700731a008e2617@mail.gmail.com>
References: <d1b08f940908151449x3365f27cl5700731a008e2617@mail.gmail.com>
Date: Fri, 21 Aug 2009 10:09:10 +0200
Message-ID: <d1b08f940908210109s16c313c5v224422ccdb56ffa@mail.gmail.com>
From: Andrea Adami <andrea.adami@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: Re: Wrong crosscompilers path after rebuild from scratch
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
X-List-Received-Date: Fri, 21 Aug 2009 08:26:35 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit

Ok, the issue is the staging-* packages are created without BASE_PACKAGE_ARCH
This patch (thx ReaperOfSouls) seems to fix it:



diff --git a/classes/packaged-staging.bbclass b/classes/packaged-staging.bbclass
index 33acb90..3b97f59 100644
--- a/classes/packaged-staging.bbclass
+++ b/classes/packaged-staging.bbclass
@@ -284,7 +284,7 @@ populate_staging_postamble () {
 		if [ "$exitcode" != "5" -a "$exitcode" != "0" ]; then
 			exit $exitcode
 		fi
-		stage-manager -p ${CROSS_DIR} -c
${DEPLOY_DIR_PSTAGE}/stamp-cache-cross -u -d
${PSTAGE_TMPDIR_STAGE}/cross
+		stage-manager -p ${CROSS_DIR} -c
${DEPLOY_DIR_PSTAGE}/stamp-cache-cross -u -d
${PSTAGE_TMPDIR_STAGE}/cross/${BASE_PACKAGE_ARCH}
 		if [ "$exitcode" != "5" -a "$exitcode" != "0" ]; then
 			exit $exitcode
 		fi



Andrea


