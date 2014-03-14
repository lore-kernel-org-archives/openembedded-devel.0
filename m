Return-Path: <martin.jansa@gmail.com>
Received: from mail-ee0-f43.google.com (mail-ee0-f43.google.com [74.125.83.43])
	by mail.openembedded.org (Postfix) with ESMTP id 2E4B76EBA5
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 14 Mar 2014 17:06:28 +0000 (UTC)
Received: by mail-ee0-f43.google.com with SMTP id e53so1630311eek.30
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 14 Mar 2014 10:06:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=date:from:to:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=SWSRIby1g8o2KDfPwkYDeeXSmBAzhgjyLVlmML2qovw=;
	b=CJLlmnA1VY+dILibv6P71bmDSqGcNeJq3FZYkyPGm3UAmgyy4P3e/yBSCnGul6OW3a
	sq1ayYtIrcrLWSViFrahNaIjON4+IfOfsFHzUQ5KUlTjqkJ0vkgvlQ5RQneiJuT+z9dw
	UcGo4Xj4jQTW1y53CCy+cJ5LeOa7UdPfAW+7cGQ49wV9S2LoJ0avOrchiUaCSFNdfdyv
	Dh1Sy5USdMTBwhzzOItlDMvBYrj4fxYBWzn+b9FJYvbREvrMrPnf+TYp6L3WodcoMWqT
	2Vg6v9aqXVKKiQwIk2lPlbaPNWdW2LYcR+U5EqmEmaFV/DQJ1UfVr2YSEGhshnq9fhTA
	pOuw==
X-Received: by 10.15.63.73 with SMTP id l49mr9309588eex.27.1394816788943;
	Fri, 14 Mar 2014 10:06:28 -0700 (PDT)
Received: from localhost (ip-89-176-104-3.net.upcbroadband.cz. [89.176.104.3])
	by mx.google.com with ESMTPSA id
	48sm6042430eei.24.2014.03.14.10.06.27
	for <openembedded-devel@lists.openembedded.org>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Fri, 14 Mar 2014 10:06:27 -0700 (PDT)
Date: Fri, 14 Mar 2014 18:06:43 +0100
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Message-ID: <20140314170643.GH3759@jama>
References: <1394808446-7287-1-git-send-email-raj.khem@gmail.com>
MIME-Version: 1.0
In-Reply-To: <1394808446-7287-1-git-send-email-raj.khem@gmail.com>
User-Agent: Mutt/1.5.22 (2013-10-16)
Subject: Re: [meta-qt5][PATCH V2] licenses: Fix WARNING: qt3d: No generic license file exists for: PREVIEW.COMMERCIAL in any provider
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
X-List-Received-Date: Fri, 14 Mar 2014 17:06:31 -0000
X-Groupsio-MsgNum: 48680
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="wj9ZLJVQDRFjGSdK"
Content-Disposition: inline

--wj9ZLJVQDRFjGSdK
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Mar 14, 2014 at 07:47:26AM -0700, Khem Raj wrote:
> Provide the license text and instructions on how to include
> it when using meta-qt5 layer

I would like to move it to
licenses/NOKIA-TPLA-2.4

to match path used in meta-oe and meta-networking.

I've also noticed that the text in this commit has couple of trailing
whitespaces while the file in qt3d repo does not, so I've used that one.

I'll send v3 from master-next with these modifications..

>=20
> Signed-off-by: Khem Raj <raj.khem@gmail.com>
> ---
>  conf/layer.conf                          |    2 +
>  files/additional-licenses/NOKIA-TPLA-2.4 |  629 ++++++++++++++++++++++++=
++++++
>  recipes-qt/qt5/qt3d.inc                  |    2 +-
>  3 files changed, 632 insertions(+), 1 deletion(-)
>  create mode 100644 files/additional-licenses/NOKIA-TPLA-2.4
>=20
> diff --git a/conf/layer.conf b/conf/layer.conf
> index 3b47b7f..585e347 100644
> --- a/conf/layer.conf
> +++ b/conf/layer.conf
> @@ -22,3 +22,5 @@ BBFILE_PATTERN_qt5-layer :=3D "^${LAYERDIR}/"
>  # other layers.
> =20
>  BBFILE_PRIORITY_qt5-layer =3D "7"
> +
> +LICENSE_PATH +=3D "${LAYERDIR}/files/additional-licenses"
> diff --git a/files/additional-licenses/NOKIA-TPLA-2.4 b/files/additional-=
licenses/NOKIA-TPLA-2.4
> new file mode 100644
> index 0000000..45740cb
> --- /dev/null
> +++ b/files/additional-licenses/NOKIA-TPLA-2.4
> @@ -0,0 +1,629 @@
> +TECHNOLOGY PREVIEW LICENSE AGREEMENT
> +
> +For individuals and/or legal entities resident in the Americas (North
> +America, Central America and South America), the applicable licensing
> +terms are specified under the heading "Technology Preview License=20
> +Agreement: The Americas".
> +
> +For individuals and/or legal entities not resident in The Americas, the
> +applicable licensing terms are specified under the heading "Technology=
=20
> +Preview License Agreement: Rest of the World".=20
> +
> +
> +TECHNOLOGY PREVIEW LICENSE AGREEMENT: The Americas
> +Agreement version 2.4
> +
> +This Technology Preview License Agreement ("Agreement") is a legal
> +agreement between Nokia Inc. ("Nokia"), with its registered office at
> +102 Corporate Park Drive, White Plains, N.Y., U.S.A. 10604 and you (eith=
er an
> +individual or a legal entity) ("Licensee") for the Licensed Software (as
> +defined below).=20
> +
> +1. DEFINITIONS
> +
> +"Affiliate" of a Party shall mean an entity (i) which is directly or
> +indirectly controlling such Party; (ii) which is under the same direct
> +or indirect ownership or control as such Party; or (iii) which is
> +directly or indirectly owned or controlled by such Party. For these
> +purposes, an entity shall be treated as being controlled by another if
> +that other entity has fifty percent (50 %) or more of the votes in such
> +entity, is able to direct its affairs and/or to control the composition
> +of its board of directors or equivalent body.=20
> +
> +"Applications" shall mean Licensee's software products created using the
> +Licensed Software which may include portions of the Licensed Software.
> +
> +"Term" shall mean the period of time six (6) months from the later of
> +(a) the Effective Date; or (b) the date the Licensed Software was
> +initially delivered to Licensee by Nokia. If no specific Effective Date
> +is set forth in the Agreement, the Effective Date shall be deemed to be
> +the date the Licensed Software was initially delivered to Licensee.=20
> +
> +"Licensed Software" shall mean the computer software, "online" or
> +electronic documentation, associated media and printed materials,
> +including the source code, example programs and the documentation
> +delivered by Nokia to Licensee in conjunction with this Agreement.=20
> +
> +"Party" or "Parties" shall mean Licensee and/or Nokia.
> +
> +
> +2. OWNERSHIP
> +
> +The Licensed Software is protected by copyright laws and international
> +copyright treaties, as well as other intellectual property laws and
> +treaties. The Licensed Software is licensed, not sold.=20
> +
> +If Licensee provides any findings, proposals, suggestions or other
> +feedback ("Feedback") to Nokia regarding the Licensed Software, Nokia
> +shall own all right, title and interest including the intellectual
> +property rights in and to such Feedback, excluding however any existing
> +patent rights of Licensee. To the extent Licensee owns or controls any
> +patents for such Feedback Licensee hereby grants to Nokia and its
> +Affiliates, a worldwide, perpetual, non-transferable, sublicensable,
> +royalty-free license to (i) use, copy and modify Feedback and to create
> +derivative works thereof, (ii) to make (and have made), use, import,
> +sell, offer for sale, lease, dispose, offer for disposal or otherwise
> +exploit any products or services of Nokia containing Feedback,, and
> +(iii) sublicense all the foregoing rights to third party licensees and
> +customers of Nokia and/or its Affiliates.=20
> +
> +
> +3. VALIDITY OF THE AGREEMENT
> +
> +By installing, copying, or otherwise using the Licensed Software,
> +Licensee agrees to be bound by the terms of this Agreement. If Licensee
> +does not agree to the terms of this Agreement, Licensee may not install,
> +copy, or otherwise use the Licensed Software. Upon Licensee's acceptance
> +of the terms and conditions of this Agreement, Nokia grants Licensee the
> +right to use the Licensed Software in the manner provided below.=20
> +
> +
> +4. LICENSES
> +
> +4.1. Using and Copying
> +
> +Nokia grants to Licensee a non-exclusive, non-transferable, time-limited
> +license to use and copy the Licensed Software for sole purpose of
> +designing, developing and testing Applications, and evaluating and the=
=20
> +Licensed Software during the Term.=20
> +
> +Licensee may install copies of the Licensed Software on an unlimited
> +number of computers provided that (a) if an individual, only such
> +individual; or (b) if a legal entity only its employees; use the
> +Licensed Software for the authorized purposes.=20
> +
> +4.2	No Distribution or Modifications
> +
> +Licensee may not disclose, modify, sell, market, commercialise,
> +distribute, loan, rent, lease, or license the Licensed Software or any
> +copy of it or use the Licensed Software for any purpose that is not
> +expressly granted in this Section 4. Licensee may not alter or remove
> +any details of ownership, copyright, trademark or other property right
> +connected with the Licensed Software. Licensee may not distribute any
> +software statically or dynamically linked with the Licensed Software.=20
> +
> +4.3 No Technical Support
> +
> +Nokia has no obligation to furnish Licensee with any technical support
> +whatsoever. Any such support is subject to separate agreement between
> +the Parties.=20
> +
> +
> +5. PRE-RELEASE CODE
> +The Licensed Software contains pre-release code that is not at the level
> +of performance and compatibility of a final, generally available,
> +product offering. The Licensed Software may not operate correctly and
> +may be substantially modified prior to the first commercial product
> +release, if any. Nokia is not obligated to make this or any later
> +version of the Licensed Software commercially available. The License
> +Software is "Not for Commercial Use" and may only be used for the
> +purposes described in Section 4. The Licensed Software may not be used
> +in a live operating environment where it may be relied upon to perform
> +in the same manner as a commercially released product or with data that
> +has not been sufficiently backed up.=20
> +
> +6. THIRD PARTY SOFTWARE
> +
> +The Licensed Software may provide links to third party libraries or code
> +(collectively "Third Party Software") to implement various functions.
> +Third Party Software does not comprise part of the Licensed Software. In
> +some cases, access to Third Party Software may be included along with
> +the Licensed Software delivery as a convenience for development and
> +testing only. Such source code and libraries may be listed in the
> +".../src/3rdparty" source tree delivered with the Licensed Software or
> +documented in the Licensed Software where the Third Party Software is
> +used, as may be amended from time to time, do not comprise the Licensed
> +Software. Licensee acknowledges (1) that some part of Third Party
> +Software may require additional licensing of copyright and patents from
> +the owners of such, and (2) that distribution of any of the Licensed
> +Software referencing any portion of a Third Party Software may require
> +appropriate licensing from such third parties.=20
> +
> +
> +7. LIMITED WARRANTY AND WARRANTY DISCLAIMER
> +
> +The Licensed Software is licensed to Licensee "as is". To the maximum
> +extent permitted by applicable law, Nokia on behalf of itself and its
> +suppliers, disclaims all warranties and conditions, either express or
> +implied, including, but not limited to, implied warranties of
> +merchantability, fitness for a particular purpose, title and
> +non-infringement with regard to the Licensed Software.=20
> +
> +
> +8. LIMITATION OF LIABILITY=20
> +
> +If, Nokia's warranty disclaimer notwithstanding, Nokia is held liable to
> +Licensee, whether in contract, tort or any other legal theory, based on
> +the Licensed Software, Nokia's entire liability to Licensee and
> +Licensee's exclusive remedy shall be, at Nokia's option, either (A)
> +return of the price Licensee paid for the Licensed Software, or (B)
> +repair or replacement of the Licensed Software, provided Licensee
> +returns to Nokia all copies of the Licensed Software as originally
> +delivered to Licensee. Nokia shall not under any circumstances be liable
> +to Licensee based on failure of the Licensed Software if the failure
> +resulted from accident, abuse or misapplication, nor shall Nokia under
> +any circumstances be liable for special damages, punitive or exemplary
> +damages, damages for loss of profits or interruption of business or for
> +loss or corruption of data. Any award of damages from Nokia to Licensee
> +shall not exceed the total amount Licensee has paid to Nokia in
> +connection with this Agreement.=20
> +
> +
> +9.	CONFIDENTIALITY
> +
> +Each party acknowledges that during the Term of this Agreement it shall
> +have access to information about the other party's business, business
> +methods, business plans, customers, business relations, technology, and
> +other information, including the terms of this Agreement, that is
> +confidential and of great value to the other party, and the value of
> +which would be significantly reduced if disclosed to third parties (the
> +"Confidential Information"). Accordingly, when a party (the "Receiving
> +Party") receives Confidential Information from another party (the
> +"Disclosing Party"), the Receiving Party shall, and shall obligate its
> +employees and agents and employees and agents of its Affiliates to: (i)
> +maintain the Confidential Information in strict confidence; (ii) not
> +disclose the Confidential Information to a third party without the
> +Disclosing Party's prior written approval; and (iii) not, directly or
> +indirectly, use the Confidential Information for any purpose other than
> +for exercising its rights and fulfilling its responsibilities pursuant
> +to this Agreement. Each party shall take reasonable measures to protect
> +the Confidential Information of the other party, which measures shall
> +not be less than the measures taken by such party to protect its own
> +confidential and proprietary information.=20
> +
> +"Confidential Information" shall not include information that (a) is or
> +becomes generally known to the public through no act or omission of the
> +Receiving Party; (b) was in the Receiving Party's lawful possession
> +prior to the disclosure hereunder and was not subject to limitations on
> +disclosure or use; (c) is developed by the Receiving Party without
> +access to the Confidential Information of the Disclosing Party or by
> +persons who have not had access to the Confidential Information of the
> +Disclosing Party as proven by the written records of the Receiving
> +Party; (d) is lawfully disclosed to the Receiving Party without
> +restrictions, by a third party not under an obligation of
> +confidentiality; or (e) the Receiving Party is legally compelled to
> +disclose the information, in which case the Receiving Party shall assert
> +the privileged and confidential nature of the information and cooperate
> +fully with the Disclosing Party to protect against and prevent
> +disclosure of any Confidential Information and to limit the scope of
> +disclosure and the dissemination of disclosed Confidential Information
> +by all legally available means.=20
> +
> +The obligations of the Receiving Party under this Section shall continue
> +during the Initial Term and for a period of five (5) years after
> +expiration or termination of this Agreement. To the extent that the
> +terms of the Non-Disclosure Agreement between Nokia and Licensee
> +conflict with the terms of this Section 9, this Section 9 shall be
> +controlling over the terms of the Non-Disclosure Agreement.=20
> +
> +
> +10. GENERAL PROVISIONS
> +
> +10.1	No Assignment
> +
> +Licensee shall not be entitled to assign or transfer all or any of its
> +rights, benefits and obligations under this Agreement without the prior
> +written consent of Nokia, which shall not be unreasonably withheld.=20
> +
> +10.2 	Termination
> +
> +Nokia may terminate the Agreement at any time immediately upon written
> +notice by Nokia to Licensee if Licensee breaches this Agreement.=20
> +
> +Upon termination of this Agreement, Licensee shall return to Nokia all
> +copies of Licensed Software that were supplied by Nokia. All other
> +copies of Licensed Software in the possession or control of Licensee
> +must be erased or destroyed. An officer of Licensee must promptly
> +deliver to Nokia a written confirmation that this has occurred.=20
> +
> +10.3	Surviving Sections=20
> +
> +Any terms and conditions that by their nature or otherwise reasonably
> +should survive a cancellation or termination of this Agreement shall
> +also be deemed to survive. Such terms and conditions include, but are
> +not limited to the following Sections: 2, 5, 6, 7, 8, 9, 10.2, 10.3, 10.=
4,
> +10.5, 10.6, 10.7, and 10.8 of this Agreement.=20
> +
> +10.4	Entire Agreement=20
> +
> +This Agreement constitutes the complete agreement between the parties
> +and supersedes all prior or contemporaneous discussions,
> +representations, and proposals, written or oral, with respect to the
> +subject matters discussed herein, with the exception of the
> +non-disclosure agreement executed by the parties in connection with this
> +Agreement ("Non-Disclosure Agreement"), if any, shall be subject to
> +Section 9. No modification of this Agreement shall be effective unless
> +contained in a writing executed by an authorized representative of each
> +party. No term or condition contained in Licensee's purchase order shall
> +apply unless expressly accepted by Nokia in writing. If any provision of
> +the Agreement is found void or unenforceable, the remainder shall remain
> +valid and enforceable according to its terms. If any remedy provided is
> +determined to have failed for its essential purpose, all limitations of
> +liability and exclusions of damages set forth in this Agreement shall
> +remain in effect.=20
> +
> +10.5	Export Control
> +
> +Licensee acknowledges that the Licensed Software may be subject to
> +export control restrictions of various countries. Licensee shall fully
> +comply with all applicable export license restrictions and requirements
> +as well as with all laws and regulations relating to the importation of
> +the Licensed Software and shall procure all necessary governmental
> +authorizations, including without limitation, all necessary licenses,
> +approvals, permissions or consents, where necessary for the
> +re-exportation of the Licensed Software.,=20
> +
> +10.6	Governing Law and Legal Venue
> +
> +This Agreement shall be governed by and construed in accordance with the
> +federal laws of the United States of America and the internal laws of
> +the State of New York without given effect to any choice of law rule
> +that would result in the application of the laws of any other
> +jurisdiction. The United Nations Convention on Contracts for the
> +International Sale of Goods (CISG) shall not apply. Each Party (a)
> +hereby irrevocably submits itself to and consents to the jurisdiction of
> +the United States District Court for the Southern District of New York
> +(or if such court lacks jurisdiction, the state courts of the State of
> +New York) for the purposes of any action, claim, suit or proceeding
> +between the Parties in connection with any controversy, claim, or
> +dispute arising out of or relating to this Agreement; and (b) hereby
> +waives, and agrees not to assert by way of motion, as a defense or
> +otherwise, in any such action, claim, suit or proceeding, any claim that
> +is not personally subject to the jurisdiction of such court(s), that the
> +action, claim, suit or proceeding is brought in an inconvenient forum or
> +that the venue of the action, claim, suit or proceeding is improper.
> +Notwithstanding the foregoing, nothing in this Section 9.6 is intended
> +to, or shall be deemed to, constitute a submission or consent to, or
> +selection of, jurisdiction, forum or venue for any action for patent
> +infringement, whether or not such action relates to this Agreement.=20
> +
> +10.7	No Implied License
> +
> +There are no implied licenses or other implied rights granted under this
> +Agreement, and all rights, save for those expressly granted hereunder,
> +shall remain with Nokia and its licensors. In addition, no licenses or
> +immunities are granted to the combination of the Licensed Software with
> +any other software or hardware not delivered by Nokia under this
> +Agreement.=20
> +
> +10.8	Government End Users=20
> +=20
> +A "U.S. Government End User" shall mean any agency or entity of the
> +government of the United States. The following shall apply if Licensee
> +is a U.S. Government End User. The Licensed Software is a "commercial
> +item," as that term is defined in 48 C.F.R. 2.101 (Oct. 1995),
> +consisting of "commercial computer software" and "commercial computer
> +software documentation," as such terms are used in 48 C.F.R. 12.212
> +(Sept. 1995). Consistent with 48 C.F.R. 12.212 and 48 C.F.R. 227.7202-1
> +through 227.7202-4 (June 1995), all U.S. Government End Users acquire
> +the Licensed Software with only those rights set forth herein. The
> +Licensed Software (including related documentation) is provided to U.S.
> +Government End Users: (a) only as a commercial end item; and (b) only
> +pursuant to this Agreement.=20
> +
> +
> +
> +
> +
> +TECHNOLOGY PREVIEW LICENSE AGREEMENT: Rest of the World
> +Agreement version 2.4
> +
> +This Technology Preview License Agreement ("Agreement") is a legal
> +agreement between Nokia Corporation ("Nokia"), with its registered
> +office at Keilalahdentie 4, 02150 Espoo, Finland and you (either an
> +individual or a legal entity) ("Licensee") for the Licensed Software (as
> +defined below).=20
> +
> +1. DEFINITIONS
> +
> +"Affiliate" of a Party shall mean an entity (i) which is directly or
> +indirectly controlling such Party; (ii) which is under the same direct
> +or indirect ownership or control as such Party; or (iii) which is
> +directly or indirectly owned or controlled by such Party. For these
> +purposes, an entity shall be treated as being controlled by another if
> +that other entity has fifty percent (50 %) or more of the votes in such
> +entity, is able to direct its affairs and/or to control the composition
> +of its board of directors or equivalent body.=20
> +
> +"Applications" shall mean Licensee's software products created using the
> +Licensed Software which may include portions of the Licensed Software.
> +
> +"Term" shall mean the period of time six (6) months from the later of
> +(a) the Effective Date; or (b) the date the Licensed Software was
> +initially delivered to Licensee by Nokia. If no specific Effective Date
> +is set forth in the Agreement, the Effective Date shall be deemed to be
> +the date the Licensed Software was initially delivered to Licensee.=20
> +
> +"Licensed Software" shall mean the computer software, "online" or
> +electronic documentation, associated media and printed materials,
> +including the source code, example programs and the documentation
> +delivered by Nokia to Licensee in conjunction with this Agreement.=20
> +
> +"Party" or "Parties" shall mean Licensee and/or Nokia.=20
> +
> +
> +2. OWNERSHIP
> +
> +The Licensed Software is protected by copyright laws and international
> +copyright treaties, as well as other intellectual property laws and
> +treaties. The Licensed Software is licensed, not sold.=20
> +
> +If Licensee provides any findings, proposals, suggestions or other
> +feedback ("Feedback") to Nokia regarding the Licensed Software, Nokia
> +shall own all right, title and interest including the intellectual
> +property rights in and to such Feedback, excluding however any existing
> +patent rights of Licensee. To the extent Licensee owns or controls any
> +patents for such Feedback Licensee hereby grants to Nokia and its
> +Affiliates, a worldwide, perpetual, non-transferable, sublicensable,
> +royalty-free license to (i) use, copy and modify Feedback and to create
> +derivative works thereof, (ii) to make (and have made), use, import,
> +sell, offer for sale, lease, dispose, offer for disposal or otherwise
> +exploit any products or services of Nokia containing Feedback,, and
> +(iii) sublicense all the foregoing rights to third party licensees and
> +customers of Nokia and/or its Affiliates.=20
> +
> +3. VALIDITY OF THE AGREEMENT
> +
> +By installing, copying, or otherwise using the Licensed Software,
> +Licensee agrees to be bound by the terms of this Agreement. If Licensee
> +does not agree to the terms of this Agreement, Licensee may not install,
> +copy, or otherwise use the Licensed Software. Upon Licensee's acceptance
> +of the terms and conditions of this Agreement, Nokia grants Licensee the
> +right to use the Licensed Software in the manner provided below.=20
> +
> +
> +4. LICENSES
> +
> +4.1. Using and Copying
> +
> +Nokia grants to Licensee a non-exclusive, non-transferable, time-limited
> +license to use and copy the Licensed Software for sole purpose of
> +designing, developing and testing Applications, and evaluating and the=
=20
> +Licensed Software during the Term.=20
> +
> +Licensee may install copies of the Licensed Software on an unlimited
> +number of computers provided that (a) if an individual, only such
> +individual; or (b) if a legal entity only its employees; use the
> +Licensed Software for the authorized purposes.=20
> +
> +4.2	No Distribution or Modifications
> +
> +Licensee may not disclose, modify, sell, market, commercialise,
> +distribute, loan, rent, lease, or license the Licensed Software or any
> +copy of it or use the Licensed Software for any purpose that is not
> +expressly granted in this Section 4. Licensee may not alter or remove
> +any details of ownership, copyright, trademark or other property right
> +connected with the Licensed Software. Licensee may not distribute any
> +software statically or dynamically linked with the Licensed Software.=20
> +
> +4.3 No Technical Support
> +
> +Nokia has no obligation to furnish Licensee with any technical support
> +whatsoever. Any such support is subject to separate agreement between
> +the Parties.=20
> +
> +
> +5. PRE-RELEASE CODE
> +
> +The Licensed Software contains pre-release code that is not at the level
> +of performance and compatibility of a final, generally available,
> +product offering. The Licensed Software may not operate correctly and
> +may be substantially modified prior to the first commercial product
> +release, if any. Nokia is not obligated to make this or any later
> +version of the Licensed Software commercially available. The License
> +Software is "Not for Commercial Use" and may only be used for the
> +purposes described in Section 4. The Licensed Software may not be used
> +in a live operating environment where it may be relied upon to perform
> +in the same manner as a commercially released product or with data that
> +has not been sufficiently backed up.=20
> +
> +6. THIRD PARTY SOFTWARE
> +
> +The Licensed Software may provide links to third party libraries or code
> +(collectively "Third Party Software") to implement various functions.
> +Third Party Software does not comprise part of the Licensed Software. In
> +some cases, access to Third Party Software may be included along with
> +the Licensed Software delivery as a convenience for development and
> +testing only. Such source code and libraries may be listed in the
> +".../src/3rdparty" source tree delivered with the Licensed Software or
> +documented in the Licensed Software where the Third Party Software is
> +used, as may be amended from time to time, do not comprise the Licensed
> +Software. Licensee acknowledges (1) that some part of Third Party
> +Software may require additional licensing of copyright and patents from
> +the owners of such, and (2) that distribution of any of the Licensed
> +Software referencing any portion of a Third Party Software may require
> +appropriate licensing from such third parties.=20
> +
> +
> +7. LIMITED WARRANTY AND WARRANTY DISCLAIMER
> +
> +The Licensed Software is licensed to Licensee "as is". To the maximum
> +extent permitted by applicable law, Nokia on behalf of itself and its
> +suppliers, disclaims all warranties and conditions, either express or
> +implied, including, but not limited to, implied warranties of
> +merchantability, fitness for a particular purpose, title and
> +non-infringement with regard to the Licensed Software.=20
> +
> +
> +8. LIMITATION OF LIABILITY=20
> +
> +If, Nokia's warranty disclaimer notwithstanding, Nokia is held liable to
> +Licensee, whether in contract, tort or any other legal theory, based on
> +the Licensed Software, Nokia's entire liability to Licensee and
> +Licensee's exclusive remedy shall be, at Nokia's option, either (A)
> +return of the price Licensee paid for the Licensed Software, or (B)
> +repair or replacement of the Licensed Software, provided Licensee
> +returns to Nokia all copies of the Licensed Software as originally
> +delivered to Licensee. Nokia shall not under any circumstances be liable
> +to Licensee based on failure of the Licensed Software if the failure
> +resulted from accident, abuse or misapplication, nor shall Nokia under
> +any circumstances be liable for special damages, punitive or exemplary
> +damages, damages for loss of profits or interruption of business or for
> +loss or corruption of data. Any award of damages from Nokia to Licensee
> +shall not exceed the total amount Licensee has paid to Nokia in
> +connection with this Agreement.=20
> +
> +
> +9.	CONFIDENTIALITY
> +
> +Each party acknowledges that during the Term of this Agreement it shall
> +have access to information about the other party's business, business
> +methods, business plans, customers, business relations, technology, and
> +other information, including the terms of this Agreement, that is
> +confidential and of great value to the other party, and the value of
> +which would be significantly reduced if disclosed to third parties (the
> +"Confidential Information"). Accordingly, when a party (the "Receiving
> +Party") receives Confidential Information from another party (the
> +"Disclosing Party"), the Receiving Party shall, and shall obligate its
> +employees and agents and employees and agents of its Affiliates to: (i)
> +maintain the Confidential Information in strict confidence; (ii) not
> +disclose the Confidential Information to a third party without the
> +Disclosing Party's prior written approval; and (iii) not, directly or
> +indirectly, use the Confidential Information for any purpose other than
> +for exercising its rights and fulfilling its responsibilities pursuant
> +to this Agreement. Each party shall take reasonable measures to protect
> +the Confidential Information of the other party, which measures shall
> +not be less than the measures taken by such party to protect its own
> +confidential and proprietary information.=20
> +
> +"Confidential Information" shall not include information that (a) is or
> +becomes generally known to the public through no act or omission of the
> +Receiving Party; (b) was in the Receiving Party's lawful possession
> +prior to the disclosure hereunder and was not subject to limitations on
> +disclosure or use; (c) is developed by the Receiving Party without
> +access to the Confidential Information of the Disclosing Party or by
> +persons who have not had access to the Confidential Information of the
> +Disclosing Party as proven by the written records of the Receiving
> +Party; (d) is lawfully disclosed to the Receiving Party without
> +restrictions, by a third party not under an obligation of
> +confidentiality; or (e) the Receiving Party is legally compelled to
> +disclose the information, in which case the Receiving Party shall assert
> +the privileged and confidential nature of the information and cooperate
> +fully with the Disclosing Party to protect against and prevent
> +disclosure of any Confidential Information and to limit the scope of
> +disclosure and the dissemination of disclosed Confidential Information
> +by all legally available means.=20
> +
> +The obligations of the Receiving Party under this Section shall continue
> +during the Initial Term and for a period of five (5) years after
> +expiration or termination of this Agreement. To the extent that the
> +terms of the Non-Disclosure Agreement between Nokia and Licensee
> +conflict with the terms of this Section 9, this Section 9 shall be
> +controlling over the terms of the Non-Disclosure Agreement.=20
> +
> +
> +10. GENERAL PROVISIONS
> +
> +10.1	No Assignment
> +
> +Licensee shall not be entitled to assign or transfer all or any of its
> +rights, benefits and obligations under this Agreement without the prior
> +written consent of Nokia, which shall not be unreasonably withheld.=20
> +
> +10.2 	Termination
> +
> +Nokia may terminate the Agreement at any time immediately upon written
> +notice by Nokia to Licensee if Licensee breaches this Agreement.=20
> +
> +Upon termination of this Agreement, Licensee shall return to Nokia all
> +copies of Licensed Software that were supplied by Nokia. All other
> +copies of Licensed Software in the possession or control of Licensee
> +must be erased or destroyed. An officer of Licensee must promptly
> +deliver to Nokia a written confirmation that this has occurred.=20
> +
> +10.3	Surviving Sections=20
> +
> +Any terms and conditions that by their nature or otherwise reasonably
> +should survive a cancellation or termination of this Agreement shall
> +also be deemed to survive. Such terms and conditions include, but are
> +not limited to the following Sections: 2, 5, 6, 7, 8, 9, 10.2, 10.3, 10.=
4,
> +10.5, 10.6, 10.7, and 10.8 of this Agreement.=20
> +
> +10.4	Entire Agreement=20
> +
> +This Agreement constitutes the complete agreement between the parties
> +and supersedes all prior or contemporaneous discussions,
> +representations, and proposals, written or oral, with respect to the
> +subject matters discussed herein, with the exception of the
> +non-disclosure agreement executed by the parties in connection with this
> +Agreement ("Non-Disclosure Agreement"), if any, shall be subject to
> +Section 9. No modification of this Agreement shall be effective unless
> +contained in a writing executed by an authorized representative of each
> +party. No term or condition contained in Licensee's purchase order shall
> +apply unless expressly accepted by Nokia in writing. If any provision of
> +the Agreement is found void or unenforceable, the remainder shall remain
> +valid and enforceable according to its terms. If any remedy provided is
> +determined to have failed for its essential purpose, all limitations of
> +liability and exclusions of damages set forth in this Agreement shall
> +remain in effect.=20
> +
> +10.5	Export Control
> +
> +Licensee acknowledges that the Licensed Software may be subject to
> +export control restrictions of various countries. Licensee shall fully
> +comply with all applicable export license restrictions and requirements
> +as well as with all laws and regulations relating to the importation of
> +the Licensed Software and shall procure all necessary governmental
> +authorizations, including without limitation, all necessary licenses,
> +approvals, permissions or consents, where necessary for the
> +re-exportation of the Licensed Software.,=20
> +
> +10.6	Governing Law and Legal Venue
> +
> +This Agreement shall be construed and interpreted in accordance with the
> +laws of Finland, excluding its choice of law provisions. Any disputes
> +arising out of or relating to this Agreement shall be resolved in
> +arbitration under the Rules of Arbitration of the Chamber of Commerce of
> +Helsinki, Finland. The arbitration tribunal shall consist of one (1), or
> +if either Party so requires, of three (3), arbitrators. The award shall
> +be final and binding and enforceable in any court of competent
> +jurisdiction. The arbitration shall be held in Helsinki, Finland and the
> +process shall be conducted in the English language.=20
> +
> +10.7	No Implied License
> +
> +There are no implied licenses or other implied rights granted under this
> +Agreement, and all rights, save for those expressly granted hereunder,
> +shall remain with Nokia and its licensors. In addition, no licenses or
> +immunities are granted to the combination of the Licensed Software with
> +any other software or hardware not delivered by Nokia under this
> +Agreement.=20
> +
> +10.8	Government End Users=20
> +=20
> +A "U.S. Government End User" shall mean any agency or entity of the
> +government of the United States. The following shall apply if Licensee
> +is a U.S. Government End User. The Licensed Software is a "commercial
> +item," as that term is defined in 48 C.F.R. 2.101 (Oct. 1995),
> +consisting of "commercial computer software" and "commercial computer
> +software documentation," as such terms are used in 48 C.F.R. 12.212
> +(Sept. 1995). Consistent with 48 C.F.R. 12.212 and 48 C.F.R. 227.7202-1
> +through 227.7202-4 (June 1995), all U.S. Government End Users acquire
> +the Licensed Software with only those rights set forth herein. The
> +Licensed Software (including related documentation) is provided to U.S.
> +Government End Users: (a) only as a commercial end item; and (b) only
> +pursuant to this Agreement.=20
> +
> +
> +
> +
> diff --git a/recipes-qt/qt5/qt3d.inc b/recipes-qt/qt5/qt3d.inc
> index cfff5ee..78b9ecc 100644
> --- a/recipes-qt/qt5/qt3d.inc
> +++ b/recipes-qt/qt5/qt3d.inc
> @@ -2,7 +2,7 @@ require qt5.inc
> =20
>  DEPENDS +=3D "qtdeclarative"
> =20
> -LICENSE =3D "GFDL-1.3 & LGPL-2.1 & PREVIEW.COMMERCIAL | GPL-3.0"
> +LICENSE =3D "GFDL-1.3 & LGPL-2.1 & NOKIA-TPLA-2.4 | GPL-3.0"
>  LIC_FILES_CHKSUM =3D "file://LICENSE.LGPL;md5=3D4193e7f1d47a858f6b7c0f1e=
e66161de \
>                      file://LGPL_EXCEPTION.txt;md5=3D0145c4d1b6f96a661c2c=
139dfb268fb6 \
>                      file://LICENSE.PREVIEW.COMMERCIAL;md5=3D9d94dadfab8b=
246782ffea02082ee13a \
> --=20
> 1.7.10.4
>=20
> --=20
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-devel

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--wj9ZLJVQDRFjGSdK
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.22 (GNU/Linux)

iEYEARECAAYFAlMjNyMACgkQN1Ujt2V2gBwOTQCfQgh/tyvRVKWkXmbJJrlQ4R7e
bBAAn1BbrwDnh/2jiJkq2Ii9MeO1UFYT
=nAMF
-----END PGP SIGNATURE-----

--wj9ZLJVQDRFjGSdK--
