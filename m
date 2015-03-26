Return-Path: <alistair.boyd@digitalbarriers.com>
X-Greylist: delayed 430 seconds by postgrey-1.34 at layers.openembedded.org;
	Thu, 26 Mar 2015 21:23:23 UTC
Received: from mail1.bemta5.messagelabs.com (mail1.bemta5.messagelabs.com
	[195.245.231.141])
	by mail.openembedded.org (Postfix) with ESMTP id 489056013D
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 26 Mar 2015 21:23:23 +0000 (UTC)
Received: from [85.158.139.3] by server-5.bemta-5.messagelabs.com id
	AA/E2-02119-E1774155; Thu, 26 Mar 2015 21:16:14 +0000
X-Env-Sender: alistair.boyd@digitalbarriers.com
X-Msg-Ref: server-9.tower-90.messagelabs.com!1427404574!430534!1
X-Originating-IP: [217.28.130.38]
X-StarScan-Received: 
X-StarScan-Version: 6.13.6; banners=digitalbarriers.com,-,-
X-VirusChecked: Checked
Received: (qmail 20566 invoked from network); 26 Mar 2015 21:16:14 -0000
Received: from hostedexchange.hostedservice.com (HELO
	outlook.hostedservice2.net) (217.28.130.38)
	by server-9.tower-90.messagelabs.com with AES128-SHA encrypted SMTP;
	26 Mar 2015 21:16:14 -0000
Received: from THHS2E12BE1X.hostedservice2.net ([fe80::b537:c55d:a0a3:e536])
	by THHS2E12HT05.hostedservice2.net ([::1]) with mapi;
	Thu, 26 Mar 2015 21:16:14 +0000
From: Alistair Boyd <alistair.boyd@digitalbarriers.com>
To: "openembedded-devel@lists.openembedded.org"
	<openembedded-devel@lists.openembedded.org>
Date: Thu, 26 Mar 2015 21:16:10 +0000
Thread-Topic: openembedded linux_2.6.30.bb check archive integrity
Thread-Index: AdBoCZNLNWmWYIqzSpSP2rjCxJv3QA==
Message-ID: <3E9437356C471846989EF7361A6953C6032412F6CE@THHS2E12BE1X.hostedservice2.net>
Accept-Language: en-US, en-GB
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
acceptlanguage: en-US, en-GB
MIME-Version: 1.0
X-Content-Filtered-By: Mailman/MimeDel 2.1.12
Subject: openembedded linux_2.6.30.bb check archive integrity
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
X-List-Received-Date: Thu, 26 Mar 2015 21:23:24 -0000
Content-Class: urn:content-classes:message
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

Hi,

I am trying to build openembedded main branch. This is failing on "oe_at91=
sam/recipes/linux/linux_2.6.30.bb" with "cannot check archive integrity" as=
 shown below.

OTE: Running task 916 of 962 (ID: 8, /home/engineer/SandboxAtmelBootMain/o=
e_at91sam/recipes/linux/linux_2.6.30.bb, do_fetch)
WARNING: /home/engineer/SandboxAtmelBootMain/openembedded/lib/oe/unpack.py=
:38: DeprecationWarning: bb.msg.warn is deprecated in favor of the python '=
logging' module
  bb.msg.warn(None, "Deprecated usage of 'patch' url param for '%s', pleas=
e use 'apply=3D{yes,no}'" % filename)

WARNING: Deprecated usage of 'patch' url param for '2.6.30-at91.patch', pl=
ease use 'apply=3D{yes,no}'
NOTE: package linux-2.6.30-r1: task do_fetch: Started
ERROR: linux-2.6.30: http://kernel.org/pub/linux/kernel/v2.6/linux-2.6.30.=
tar.bz2 cannot check archive integrity
NOTE: package linux-2.6.30-r1: task base_do_fetch: Failed
ERROR: Function 'base_do_fetch' failed
ERROR: Task 8 (/home/engineer/SandboxAtmelBootMain/oe_at91sam/recipes/linu=
x/linux_2.6.30.bb, do_fetch) failed with exit code '1'
ERROR: '/home/engineer/SandboxAtmelBootMain/oe_at91sam/recipes/linux/linux=
_2.6.30.bb' failed

Can someone advise what I need to do to resolve this issue?

I see the same cannot check archive integrity error for these recipes as w=
ell:

oe_at91sam/recipes/libmatchbox/libmatchbox_1.9.bb
openembedded/recipes/matchbox-wm/matchbox-wm_1.2.bb
oe_at91sam/recipes/xserver-common/xserver-common_1.22.bb
oe_at91sam/recipes/gpe-mixer/gpe-mixer_0.42.bb

Thanks,
Alistair


Digital Barriers e-Mail Confidentiality and Disclaimer

This message contains confidential information and is intended only for th=
e individual named. Please notify the sender immediately by e-mail if you h=
ave received this e-mail by mistake and delete this e-mail from your system=
. E-mail transmission cannot be guaranteed to be secure or error-free as in=
formation could be intercepted, corrupted, lost, destroyed, arrive late or =
incomplete, or contain viruses. The sender therefore does not accept liabil=
ity for any errors or omissions in the contents of this message, which aris=
e as a result of e-mail transmission. The recipient should check this email=
 and any attachments for the presence of viruses. The company accepts no li=
ability for any damage caused by any virus transmitted by this email.

Digital Barriers plc is a company registered in England and Wales. Registe=
red number: 7149547. Registered office: Enterprise House, 1-2 Hatfields, Lo=
ndon SE1 9PG, United Kingdom. For further information about Digital Barrier=
s, please visit www.digitalbarriers.com<http://www.digitalbarriers.com/>.


______________________________________________________________________
This email has been scanned by the Symantec Email Security.cloud service.
For more information please visit http://www.symanteccloud.com
______________________________________________________________________
From martin.jansa@gmail.com  Thu Mar 26 21:34:23 2015
Return-Path: <martin.jansa@gmail.com>
X-Original-To: openembedded-devel@lists.openembedded.org
Delivered-To: openembedded-devel@lists.openembedded.org
Received: from mail-wg0-f43.google.com (mail-wg0-f43.google.com [74.125.82=
.43])
	by mail.openembedded.org (Postfix) with ESMTP id B5E4273C2F
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 26 Mar 2015 21:34:19 +0000 (UTC)
Received: by wgdm6 with SMTP id m6so79234804wgd.2
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 26 Mar 2015 14:34:20 -0700 (PDT)
DKIM-Signature: v
