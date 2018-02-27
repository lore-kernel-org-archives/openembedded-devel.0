Return-Path: <johannes.pointner@br-automation.com>
X-Greylist: delayed 902 seconds by postgrey-1.34 at layers.openembedded.org;
	Tue, 27 Feb 2018 07:35:10 UTC
Received: from mail2.br-automation.com (mail.br-automation.com [213.33.116.60])
	by mail.openembedded.org (Postfix) with ESMTP id ACFCD60017
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 27 Feb 2018 07:35:09 +0000 (UTC)
X-AuditID: c0a80110-efdff70000000ea0-0c-5a9506a80be2
Received: from brsmtp01.br-automation.com (Unknown_Domain [192.168.1.60])
	by mail2.br-automation.com () with SMTP id 22.F0.03744.8A6059A5;
	Tue, 27 Feb 2018 08:20:09 +0100 (CET)
MIME-Version: 1.0
From: Johannes Pointner <johannes.pointner@br-automation.com>
To: openembedded-devel@lists.openembedded.org
Date: Tue, 27 Feb 2018 08:18:41 +0100
Message-Id: <20180227071844.23571-1-johannes.pointner@br-automation.com>
X-Mailer: git-send-email 2.16.2
X-MIMETrack: Itemize by SMTP Server on BRSMTPINTERN2/InternSMTP(Release
	9.0.1FP5|November 22, 2015) at 27/02/2018 08:20:05,
	Serialize by Router on BRSMTPINTERN2/InternSMTP(Release
	9.0.1FP5|November 22, 2015) at 27/02/2018 08:20:10,
	Serialize complete at 27/02/2018 08:20:10,
	Itemize by SMTP Server on BRSMTP01/Eggelsberg/AT/B&R(Release
	9.0.1FP5|November 22, 2015) at 27.02.2018 08:20:08
X-TNEFEvaluated: 1
X-Disclaimed: 47499
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFupkluLIzCtJLcpLzFFi42I5sILRRncl29Qogx+7eCwuHl7K7MDocW7j
	CsYAxigum5TUnMyy1CJ9uwSujEO/HrMVHOesWHqll7WBcQFHFyMnh4SAicTiZ1cYuxi5OIQE
	NjFKrNp8kREkwSsgKHFy5hMWEJtNwFbiyISvYLaIgK7Exw9zwWqYBawl3i9fwApiCwPZexsu
	g9ksAqoSlyfsZoaY4yFxp3s+VL22xLKFr5khFstLLDx7lRlksYRAB7PEtpXTWCESQhKnF5+F
	KhKWOLZoBcsERr5ZSG6ahWTWAkamVYziuYmZOUZ6SUW6iaUl+bmJJZn5eXrJ+bmbGCEBJLCD
	cfcb7UOMAhyMSjy8OQxTo4RYE8uKK3MPMUpwMCuJ8K5cPDlKiDclsbIqtSg/vqg0J7X4EKM0
	B4uSOG9OknGUkEB6YklqdmpqQWoRTJaJg1OqgXHRrPrWiVZHIm96b7Jf5n3KPHjyRBsP9jeG
	GbaRcqZvajWvMsa2nVucceU0c9i9C7ZMZlah7BdXSayZorF7233mms9Lj7fGnHRIYJNe/1pO
	ID1AS39BXN9V5q0RVl/XX37zmvHIV8YHD5/Nmv40VjJ41a4FwccXxfj0Z+z50rC8oW6jjUHL
	xIdKLMUZiYZazEXFiQAfc4miHAIAAA==
Subject: [meta-networking][PATCH 0/3] update to samba 4.7.5
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-devel/>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Tue, 27 Feb 2018 07:35:11 -0000
Content-Transfer-Encoding: quoted-printable

This series upgrades samba to 4.7.5 and includes needed updates for libldb
and libtevent.

Johannes Pointner (3):
  libtevent: update to version 0.9.36
  libldb: update to version 1.3.1
  samba: update to 4.7.5

 .../samba/{samba=5F4.7.0.bb =3D> samba=5F4.7.5.bb}       |  7 +--
 ...ions-for-packages.patch =3D> options-1.3.1.patch} | 38 ++++++++----
 .../libldb/{libldb=5F1.2.2.bb =3D> libldb=5F1.3.1.bb}    |  6 +-
 .../{options-0.9.33.patch =3D> options-0.9.36.patch} | 68 ++++++++++------=
------
 .../{libtevent=5F0.9.33.bb =3D> libtevent=5F0.9.36.bb}   |  6 +-
 5 files changed, 67 insertions(+), 58 deletions(-)
 rename meta-networking/recipes-connectivity/samba/{samba=5F4.7.0.bb =3D> s=
amba=5F4.7.5.bb} (97%)
 rename meta-networking/recipes-support/libldb/libldb/{ldb-Add-configure-op=
tions-for-packages.patch =3D> options-1.3.1.patch} (83%)
 rename meta-networking/recipes-support/libldb/{libldb=5F1.2.2.bb =3D> libl=
db=5F1.3.1.bb} (91%)
 rename meta-networking/recipes-support/libtevent/libtevent/{options-0.9.33=
.patch =3D> options-0.9.36.patch} (81%)
 rename meta-networking/recipes-support/libtevent/{libtevent=5F0.9.33.bb =
=3D> libtevent=5F0.9.36.bb} (89%)

--=20
2.16.2



