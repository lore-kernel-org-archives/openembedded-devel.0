Return-Path: <mkelly@xevo.com>
Received: from NAM01-BN3-obe.outbound.protection.outlook.com
	(mail-bn3nam01on0053.outbound.protection.outlook.com [104.47.33.53])
	by mail.openembedded.org (Postfix) with ESMTP id 2B66F78224
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 23 Jun 2017 23:21:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=uievolution.onmicrosoft.com; s=selector1-xevo-com;
	h=From:Date:Subject:Message-ID:Content-Type:MIME-Version;
	bh=Is7jpdkBZeK3zTJH3zkgLL1J4h/9zp9oq9pPfDvZU6A=;
	b=oo8m5WSbrCcWSZ0CVmWwQpjt4erKGNMbKpm95WQ4T4AbQ7QlzK8RDNSRIGdwa7xtZM+cDMaOQRuATgNnLFbvCz0Mrf9E7ByS6+ZCEFqliD8tnfUrk6RrTCd7og0PfkG+RHJP+gu5JMcs7+B7pA8qjTJDYKQ6u+5UYiOoCvkhx9k=
Authentication-Results: lists.openembedded.org; dkim=none (message not signed)
	header.d=none; lists.openembedded.org;
	dmarc=none action=none header.from=xevo.com;
Received: from columbia.surround.io (65.122.179.226) by
	CY4PR0101MB2935.prod.exchangelabs.com (10.171.223.140) with Microsoft
	SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id
	15.1.1199.15; Fri, 23 Jun 2017 22:49:05 +0000
From: Martin Kelly <mkelly@xevo.com>
To: openembedded-devel <openembedded-devel@lists.openembedded.org>
Date: Fri, 23 Jun 2017 15:48:41 -0700
Message-Id: <4d63e565387845d51739e7664480485361561efc.1498257745.git.mkelly@xevo.com>
X-Mailer: git-send-email 2.11.0
In-Reply-To: <cover.1498257745.git.mkelly@xevo.com>
References: <cover.1498257745.git.mkelly@xevo.com>
MIME-Version: 1.0
X-Originating-IP: [65.122.179.226]
X-ClientProxiedBy: CY4PR08CA0055.namprd08.prod.outlook.com (10.171.251.148) To
	CY4PR0101MB2935.prod.exchangelabs.com (10.171.223.140)
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: cb9dbf20-a331-4d01-9f23-08d4ba8a0cfc
X-Microsoft-Antispam: UriScan:; BCL:0; PCL:0;
	RULEID:(300000500074)(300135000095)(300000501074)(300135300095)(300000502074)(300135100095)(22001)(300000503074)(300135400095)(201703131423075)(201703031133081)(300000504074)(300135200095)(300000505074)(300135600095)(300000506060)(300135500095);
	SRVR:CY4PR0101MB2935; 
X-Microsoft-Exchange-Diagnostics: 1; CY4PR0101MB2935;
	3:UwPX3nqvlGIlRVQ2jnPbVanW+S+j7f4ajthtYmCpFx4VQRaiWZhx83bHLxPQEhfWEoZOOcC7qi8bHWhciw/01D5v/pcQxJWpJuWoUCfr2HJayncJa2CoN/+bvYrzZEcfxf8PVUioofUh3BYM4eD8xCf2yQ5wOhGj6XZkzNU7cwqaoQR238jKbWrl+yfdtLi1D/+PymcndRbmTwFiUqIlEy78PJgtMwYzdouH7firkwtiiBFPaVNs9F2/6ne46fR+LKlkpQYQHnee5XjZXwc7/0t6ztgEe4BB8CNKSBpub/SMrnIf0/Is+MRhJXWwpeDjdh7Yh9Oe6DvPtkG2HHAlWdJOSoRLqdSXWLdopcuPPtx7qkg+povVD4yLieC0PJ93IQgPcw/Z9d9TxwboyG0lSxQ+RjVMmytwD8MKsbPavb+IH6FJ0mGmuBTMoUZCopnOuyn2wdYA9+N5Gofk+v/yY3YzumfzIxrDbDlFY08rktHzszNXTwTiIClVaxfG+R2MLHi8gAHf17VzxScgdJingmH8o3MK6tqD9QlB+VnvaqHhcz6KVTLKGhUqsM8NPhs83rbacloFOc0mAhm0bYAlgbOSGsPzwgOB6Ue7ISv4L1YEqdQ5CB3IGq0NhhupsVA4rJbneQ8u3CcMYhq/0NkFg1Qz4CNIEbXtVw5QW3ReJqkjG79lG5bC9UjiDDB459znTIhj7bLIMduZZM0+DQ8hFx42vuaOvyb6ny8yd51s6+A=
X-MS-TrafficTypeDiagnostic: CY4PR0101MB2935:
X-Microsoft-Exchange-Diagnostics: 1; CY4PR0101MB2935;
	25:4dkJ8sBm6J9+AlarOqPEDfYS5CB6V3klr4LYFnB9yQKPfRuiZe7QnVTK9nk6gIJHdfWtB/0CzttDFoebvlwWFsj/sXVfJwr+b92IBIdiPyBABWsFVuyKlTVB2a/cSn+4uN5MNDosIrLIytVQFoBfP6dUvRoHvaRVBLyRkPQLxyRo8WMnMIBPLPO2Na2VSakhBLbzu0wDoQ6z3Tc6lwe4agtPhqPKb1YG+jRv2I0k0U9/U65Vl/IuBRGX8FnSvKgn9bVH4igZ8iIMxOn1zZOL71BgVq1xSdkfETS/PEmMw2EoveduKRJAN5kkU6PHhi9e1yETrYUU0M6EGBp3qcVDixKm7P/VsYY+Rd/HntV6fTNlTij8wpW/8ZYfahyzQvL6dWXd4lkQPo8xS5JSI1IzZ6i0kwZqbUhQBcTCIHbuan7SJmEX7Fg8qm3xFZOxKh4gFDi8mIuEDPOzQO/p8BjoVjV4qWUxNfNt/tKKhnyNFgRBdoBtAxUe40/VVz6mI9dL9kYHoKxjTm8uTV85RCFfw2Lp3lp6+OSNGo3jYHoy+8V9MLMF3XClMxM2m5rnofLW5+NrmQVWOATqChux6WWwdPpTeTSwxn2Mug0kjDLe20NcXxIqd6zk1ihYQtNFD6m5yyh7ern0cRMU+WeR6eFqe3YKKZhaHeQIy4iwhw3gF08UdQHtGJFOZ5TSWcw1VwzfWRwO6np7wRSY/Jo1dopj0OXhYF01m8rKhFDoAC4pqXCRDgXSybGHnn/elZlR7Gj7ejEnPr+/uW6GNQvK0ZoV60xJ38chVQ0FkLXgTlrRmpQrUS2Vp+RgoAC02Vkt5FWvKyJafaL5EMlv/1qlldIjRmpLEz6vWUb0sIEPacWtvb4zaY9bZG+vUz4whYn88g6W/w3IJAwmhrb3D9BKrneuCH5/0ChpM4hO78bxQAUCUgo=
X-Microsoft-Exchange-Diagnostics: 1; CY4PR0101MB2935;
	31:BaYwct4ZJHbpPs0X9MGFoTgI+Sf43qsBEMqwiQbTgmAn8ud/5af5UatQH3hBatmWIkzUVgt70/p+1bI9bRGnLkK7vE6RicY65VLbOFg9IVxmpj35UGm19b2gtcM8L8mNORrO/P3K7ov5mVR0iH9BrXaXMEwt1yn2gSqSauOJrOcfZrEudqRFFLi2U7CZkLsdWD0gi/dIpUfTV1kY3uc7Zska9HvIGYKdbNt263Glrtsh9SRfApoq/F2j18jKrluPEiWdh2Hn9L2CMU0wCXy8vHkIWvqv7Z223JfAn9Ak1mnbb0Cr/b31n35SfbmWIHcX8Yj+5GA5B3GYeHJcoJeo1OMAuSSKBiq2CuQtum+aVJs6mULcPWWMXPVOd1sBV4DMAikZV2aIjxm8FpvIAxz7eh6fbZNBhl1bSEJ9dK8CLVynkLpWVw3MaCwTz5wbDH4uJVKl5dxENlWhqXwaqKad/py8mbfsso25AcOXmEL50uLzrdmEJVDDQCep5wjqen6sc4c/6erV5gdHSBF/RlNHSyq9xYCl3YxOPAgmdPVhyaW5y2mCoUPSipTdjdqSIxInoVHKVQ1P2nqe/BLxpgodM/QLrrHUeZKif/SfV7P+WAzRvExcNpEMaeF1eG0Z5rL9hb2m6MndawjkwRrX6u6IivEGUETZMDUGaem0qifdbWw=
X-Microsoft-Exchange-Diagnostics: 1; CY4PR0101MB2935;
	20:IS5z7oqI90b+9mR3CemKx47b8k5F6g+7JuHtjJ1nP1SkJ64jnJUjChH4DSXhRisF1/i2BUBhdlH1PCGw5eg5NK9iKiYNhLUH64ZRUg1FLwE3UdTD0MCes2ncQ6XpGuILZiYa4D8E1PEgISXrSB0f3NPbxbl/gGZeL7cyF2IA7q0O1nJqewpgPQ3Un8gPuDsLbBuSCkWlJHYQ737d9hFRicuzH2JTb1KZeHvfxCqRYKw4QjqanQNxlEPlJPYDN90kWAQozfre5EASc+cPwZlFopNbsgpUNr7PqfdSB4s2kCR8OVYaqUJpq0VlVab9+R71ZA5mw0RVwCQEphL06TfuCQ==
X-Microsoft-Antispam-PRVS: <CY4PR0101MB29357D34E26A76E0A58B9685ABD80@CY4PR0101MB2935.prod.exchangelabs.com>
X-Exchange-Antispam-Report-Test: UriScan:(133145235818549);
X-Exchange-Antispam-Report-CFA-Test: BCL:0; PCL:0;
	RULEID:(100000700101)(100105000095)(100000701101)(100105300095)(100000702101)(100105100095)(6040450)(2401047)(5005006)(8121501046)(3002001)(100000703101)(100105400095)(93006095)(93001095)(10201501046)(6041248)(20161123560025)(20161123562025)(201703131423075)(201702281528075)(201703061421075)(201703061406153)(20161123555025)(20161123564025)(20161123558100)(6072148)(100000704101)(100105200095)(100000705101)(100105500095);
	SRVR:CY4PR0101MB2935; BCL:0; PCL:0;
	RULEID:(100000800101)(100110000095)(100000801101)(100110300095)(100000802101)(100110100095)(100000803101)(100110400095)(100000804101)(100110200095)(100000805101)(100110500095);
	SRVR:CY4PR0101MB2935; 
X-Microsoft-Exchange-Diagnostics: =?us-ascii?Q?1; CY4PR0101MB2935;
	4:fb9v3w3+ZythHBNb5pRK/ueH4LT+IahR+MOByVeP?=
	=?us-ascii?Q?iEDQobhVbVTrG3Qc3KlZT6/YZ70QGRC1M+ipt6k864rAH7eml8509UreWu2u?=
	=?us-ascii?Q?Yqcyb72MvLD7L2HAfx3XxsbUANqeRHaFWFbsGZqOzSpLyrcnSK93E5Rx1kYX?=
	=?us-ascii?Q?rG8jt1Ngeg7eHArbMhIMK2tTymddPVYWXHMPqaEQf4L9dp17BGwte+wc2K8Y?=
	=?us-ascii?Q?ejMclEckll5unEaFY7fsDh8HD+Gtcm7J4vFD1ihRlMeXRo/F3JevBPRFa51a?=
	=?us-ascii?Q?bngqniCKxhxlFlnmIVW+UqS0a/LNuE0uyvIcH8tZi1MtSXIukMmj+8j8RIFK?=
	=?us-ascii?Q?U7Ms9redTcRxiH4cDRYpds4LErpnrWqer5ZnWwIOhCjlXkZw/NBhvnJVgCSg?=
	=?us-ascii?Q?XHWRirO78+Oqlwy9BALwvaU8Qa1TVNb/nYM95/3clLd8CUBqW0+jMqRFTPR1?=
	=?us-ascii?Q?ZNyhTsR69ys891jxP24QnuNMGvZx7Lnkl3XmjGF0NXHv1VOiUcFm9tXTsZ/F?=
	=?us-ascii?Q?XvDpEnGknVc1RK+tjw7K0dpsAVA6g4Msy1JVFntbjtgMLweXG6V3jm/rV46f?=
	=?us-ascii?Q?i6y8hQ3wXwnHXbx6wa+tQuPLnVuUJCgsdYC2T8rJjySeJ+RQWnRT1JvKK32H?=
	=?us-ascii?Q?k8vBt93zjqem6QRp2ZnXH2GliSK49YvsFn7FrHWSDxwlYa0ZnxODAW8hiUfS?=
	=?us-ascii?Q?LbJk1duauUd+c4i+GWJaHafUHVNT8L3fwnnCknrx/vbPWJnO0cM2sZCIGNU0?=
	=?us-ascii?Q?r/y3ZjcDmZOGVwkLbEwA5ZzI9zD0wGapwaL4x6EWYrHin1wxd1VmaMm64Raf?=
	=?us-ascii?Q?QSp98t5XbwINCZD4UVg38JLeLJKbcBZa6fAgWwMyIZ2tUKC6hDfsf6Sscoc0?=
	=?us-ascii?Q?6qKnry5xr//sw7WLEDKaJ/DNqv3INOM5f8JBOCxddf9rXDht573VZBIHPi6x?=
	=?us-ascii?Q?kOo19mIF9RxRd5qKSL0PCzsHByoIZHXU8u40N4vpauQbftKWxkLYr1dSCt4V?=
	=?us-ascii?Q?Bxq/5V14yr6qg5KCfWFkZy26B8u4EssY83CkQrdTSyogr3MJhsKiXxuL2DSW?=
	=?us-ascii?Q?s2PwjOxDYWQxL+bCjfc45o8IdLzpitqEzCAVs1o5Nmh09JVQWEwqAipNqZN5?=
	=?us-ascii?Q?bhgHetb9fpz87Hq8rkAOiFFjBl3Xzne3OLekp+sqqck/luXgGTdF3CBzqWgj?=
	=?us-ascii?Q?L7TjcPQYoyxqTjc=3D?=
X-Forefront-PRVS: 0347410860
X-Forefront-Antispam-Report: SFV:NSPM;
	SFS:(10009020)(4630300001)(6009001)(39450400003)(39410400002)(39830400002)(39400400002)(5660300001)(50986999)(53936002)(33646002)(5003940100001)(76176999)(8676002)(478600001)(50226002)(42186005)(47776003)(53416004)(66066001)(6666003)(2950100002)(118296001)(6506006)(6916009)(86362001)(50466002)(189998001)(81166006)(48376002)(36756003)(4326008)(6116002)(54906002)(3846002)(25786009)(2906002)(230783001)(110136004)(6512007)(107886003)(6486002)(305945005)(38730400002);
	DIR:OUT; SFP:1101; SCL:1; SRVR:CY4PR0101MB2935;
	H:columbia.surround.io; FPR:; SPF:None; MLV:sfv; LANG:en; 
X-Microsoft-Exchange-Diagnostics: =?us-ascii?Q?1; CY4PR0101MB2935;
	23:5ae5m3UUFoZgTUPVrUIDJTy37T+p9vixKyzuia6?=
	=?us-ascii?Q?M7F74F5g8yqWdUDDLsdPV//b/jdLgHY6vtR50zEVxj3bpdWE3VVFeV6tVZCI?=
	=?us-ascii?Q?7UIrTuma7anBjR1ENoTl6UnBvGmt2Daa9vd4aMbaCxPiFtYCrgYh0hZYLNOo?=
	=?us-ascii?Q?S8XmJplDx1yWBwd0i00JceAysCDjUzSrcZYRlQn+pv5VUsl/QdJ42E9kr+tg?=
	=?us-ascii?Q?wLogJK+JnQQ7Z+LLyGT3fIieyWsJO6KK7t3Jw24ymg4dfYEnbXvijt5NtBaL?=
	=?us-ascii?Q?JfLAGMhMxOKzKyX/KRj4B5QcKy9LFyqSh7SjkEaGLWkmjMaEIW+JET6bGZZD?=
	=?us-ascii?Q?MSbS2dZg8QvAJWQ8cAVSSJqOrDSYlDDbS2aptOV/VfIAbMn/VBvqXB/dNo5S?=
	=?us-ascii?Q?Vd/FUnY6Tihb2E0+7UXB/c9RsyVHMPtpS05dqpHvfj7z04l61iwS+xtmV7Xb?=
	=?us-ascii?Q?CzY0P5pJExrxYhW0Ckuo8aw0dppMhcuy2FNi/LyjBC+meaSW7Ndhssd8ILUM?=
	=?us-ascii?Q?a7CjpUZpVSLQ6v/LKMQuVVNBB8P5mKUtKrObe+efZHiJcrHEV4EMP17svX1y?=
	=?us-ascii?Q?W9Xn0Pn1bSSmNTPb1ClSGe2BdURilsxaViJ+5sXZb1cOag0KherDQ5DupRw9?=
	=?us-ascii?Q?ieFxJP0kyLD9L8+e6ZoOl42Ioa5mUei42YAOaANX6DBE/P5CxBowgYQTjLTW?=
	=?us-ascii?Q?OhgRNiX9tWcEFcusI4CmESQLDbO0SW2uyikGbG6Y3+TNRCzch3gaSIx6dFB9?=
	=?us-ascii?Q?ckLGjmgnXqs3/lCku3Ynt3drgo0C/1VBxHwGXPfon58gi7XRLUECMCjRz2Jq?=
	=?us-ascii?Q?qLVGXxfAz4zKnYzPYSEyB2CEbHKZV8NlzSADuwqQMIlxszTiS3M0sAyKSy2F?=
	=?us-ascii?Q?kh+eEZ6G9Eiwix/v8rTQEe9B/dYfahPKCGQmBsMNGoo1eQ7UGrUx2gzICgpU?=
	=?us-ascii?Q?UFz2dQwYlyNMM6BMQVgQ78KJFejtbXV4d18aNprY12e5x40PT+VT8boxgSmS?=
	=?us-ascii?Q?rb8LhTIs8CmBmQQCCFJ+ljhNaSMa+zHmsDSbOeS3Ytx3JnKMdYhuZ0H2uZpG?=
	=?us-ascii?Q?cPHwoWJLdyw+UDmqjYy7E58rxtZil3mruZY6s2IKyiS5rd52XgQ=3D=3D?=
X-Microsoft-Exchange-Diagnostics: =?us-ascii?Q?1; CY4PR0101MB2935;
	6:9eXnx6moZYxsJjsrRgnd7FdvuGnlQqFXzee1Unh/?=
	=?us-ascii?Q?18AI9qrDRyq800MThzmGB09PZ/D9zJCO4lS7x5GWojLOcYq2+DTtjqGGIInB?=
	=?us-ascii?Q?GLEaX9rPNdw94JDj7XoEKumqnb21y1QrU76ePJnLl9Nmf0+OZV/QIg4zR1Pm?=
	=?us-ascii?Q?mF+DtdOPhM+1kOlqi1yNRt/pQt1ytCDyYD6ti1bMD+3IhJb1jENGYarzKq1p?=
	=?us-ascii?Q?ZD8Oqb60C/AdtNJKOPn3oI7G7lNR0GvBnQqMOofuEFWTOSFKe3nkgHDpA9ok?=
	=?us-ascii?Q?pT94FJp5LG33MZKf+p8qWAu2gNPE7slQ6k5Bu02KXzJZGhqi/zD2ilsO8Q1X?=
	=?us-ascii?Q?HxcHgFlueVKr0QGhhY0GGB0L0VR3sMMephc4acHhA7AnsufeIuuqI+S8fP86?=
	=?us-ascii?Q?h0/IawCWLhWu+NlbVIfFzd0rpXdwpu1jhfGjYGbjTTe91tCoSdcX2dyzwrmy?=
	=?us-ascii?Q?eKgHpl2NbKcsewzzXGyEDkKTJLUPXcjztwBOGRyP2Frqrvcdl0mTlTMKIXhn?=
	=?us-ascii?Q?iseLnw5hnPj7MpyVKPGav2fQ0ntZwXh4QZ5FfUqa5CVOc82jXQCMay7srA3S?=
	=?us-ascii?Q?FzW6iaZA4GPh3gCcFqop3pK8Cm8h8xeGyY5+Mx2Tu8MdiTmEUiUszn/zWI1u?=
	=?us-ascii?Q?3GroKCaRCx12qH5iWTHralW/oZ+xsxTdYcvBILQsHolMmVmPaH4DXTliaVJH?=
	=?us-ascii?Q?riKnfRuL4VM+HUYP71rk0DNg7STUoTdRpeTs55JNWinc/4tKOHiK+O+E5TL0?=
	=?us-ascii?Q?C7dWdfxsb5eGQUNB939Ppku+KFWEnYNAM6/UvF1sfoc02jQYaOzBctrMKp3U?=
	=?us-ascii?Q?BDJyS7TXTcK/iECoyAiGCTByTz8Y0mTSSUrJJRLlj2T/OJcPTXZZ6wXzk6sm?=
	=?us-ascii?Q?sPGnEy5gDh3Nssf7T/QMiWw9fwLTUxJazqEx0bRSaGoyhfxxbsDYkHuQcaIT?=
	=?us-ascii?Q?VBJ6ZGj2TO1myXOWtiqbt5c8wlPfDxrQfIBEoQ1c1jOOWtg8P4iwlu62lAPb?=
	=?us-ascii?Q?JZU=3D?=
X-Microsoft-Exchange-Diagnostics: 1; CY4PR0101MB2935;
	5:KpAPiQvIzxlk8nFzf6cJzXXJnO/ahSREXN5l20LtVqGDQQVkM+Ts83tz1h722eVU2x0j1djLBgjyRwFpQYmjsVST6XCET5yFuVNW+EFKLhq0B8/WQbfBktkMy3P6NentwXW5dQvaJnxqpUSr9NU7r9YA1LUs+gQmwl9dXebL2ki4SoFT3wZay3J2wKLi2ow8KA04ROGjgbJZir5iVLvf7AH8Kk23Wq1ca4hqxbTvQDxV6+QcdEZMsEmgGihUqGVFbKbf/tWaek8h+0YPSitnvEoZQOfbf89EYPIsc6lZSjvb3BilTUmhASoXP/uXcOzzH2sbAVxEKxi7RMpDkPHdi4YzDjlQMJOn5KM6nYLQVoWk+gR98obf0jA5or+WjtZ4kp1Ztq88UQIDYQVsuu0sjP3mfNw/BJPovbDyJlUaMDiypUm5y2gL0EmXnuf/ec8++W7UCa2Rk7ZRP2t7BBwCmqbUJFJK12PetYrs5paKd+toxpvfufeClqtly4tEzw6d;
	24:wyKYWhnfFkQIl8dxKHVlpFcXe+M7otZQJgDLlEOMUgnj13SvSuQ5KW8nPC8V1pkaNhHpaXxDFkiQGeLCO2kZMTrL9t/94oW8XTLadIrsHQ0=
SpamDiagnosticOutput: 1:99
SpamDiagnosticMetadata: NSPM
X-Microsoft-Exchange-Diagnostics: 1; CY4PR0101MB2935;
	7:jzHnIXd0LTCOAftbZQ2pXUm1BnThuml4MIW+FhZ7fgBLV1JOPaNlNEyw6Tw08+fszDTxaQ3oAmcBJttpm9R+ZjRzbWx/BOxQ5Tmi7QOp1ccbKxNNTqbDHiOMkGA29uL4UVYMvOdyrv+NFim4f2dTvtjTnyO8SruCQ+zLepNs/wbsgL5Q8FKMfU/C1v3ayovsJ4FLvDJMba9jlMythhe9qKIXNHV1AWNF/6QgvyQzeD67S/BXZu2179ibZBwVUGsRliBXfpvKVGn+ercbN6ueLdWAe2KWuDgNsytcXNJff7AT0IpMuzjycoA0zS3RjJoi5P9am19lNDu2tQn4RUGEZ/gl5rdjgs6C9NOkrewaAORbcG6sTJcsG1iFQxQGta99A66aYO17ZFyepDlYoUuGxfoJ0VrQY3Rq4zXFIreXRACDbP88PzBjTRGxH6yWbfbncfRukA4RCVMhFLEgNY2qE+aGWwh/aiweHV4hZBhb0FdawVeymuzyyOE6S2b6uXhmLxm3momTkdtjctJj+Wr0g8voRCMwzogIHVur4o7X7EFzVRS57vJEQtvCW+BHhtHgh6fMm2CFUkByLtsMG//ItWGkGvPBdxubFJk9D7QnYJV5RCDhsZe5Hz7MIkT4dZVZrVDY3Q0t+/trIhlAYBFerxQilg+j03r0hc6v5K7ovoQOvR+gpBkv6qkpkGB1Zmu6BIO6Ii9r3E8wedve/B9TfTaP8ZF0hJvBWf5SssGNoZnmA3jqz0S/PEDvFJloBCxc8Mxn4OPYGyzm88Sneli4ZX5lusgDDqISf2yp5CHeomw=
X-OriginatorOrg: xevo.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Jun 2017 22:49:05.0406 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY4PR0101MB2935
Cc: Darren Hart <dvhart@vmware.com>
Subject: [meta-oe][PATCH v2] 10/17] open-vm-tools: add missing X11 dependencies
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
X-List-Received-Date: Fri, 23 Jun 2017 23:21:46 -0000
Content-Type: text/plain

Certain dependencies that are implied when we build with X11 support -- such as
libxext -- were missing. Add them, and meanwhile switch to using
PACKAGECONFIG[x11] instead of DISTRO_FEATURES.

Signed-off-by: Martin Kelly <mkelly@xevo.com>
---
 meta-oe/recipes-support/open-vm-tools/open-vm-tools_10.1.5.bb | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/meta-oe/recipes-support/open-vm-tools/open-vm-tools_10.1.5.bb b/meta-oe/recipes-support/open-vm-tools/open-vm-tools_10.1.5.bb
index 2b2022864..76d3840e6 100644
--- a/meta-oe/recipes-support/open-vm-tools/open-vm-tools_10.1.5.bb
+++ b/meta-oe/recipes-support/open-vm-tools/open-vm-tools_10.1.5.bb
@@ -47,11 +47,13 @@ KERNEL_MODULES_META_PACKAGE = "${PN}"
 SYSTEMD_SERVICE_${PN} = "vmtoolsd.service"
 
 EXTRA_OECONF = "--without-icu --disable-multimon --disable-docs --disable-tests \
-		--without-gtk2 --without-gtkmm --without-xerces --without-pam \
+		--without-gtkmm --without-xerces --without-pam \
                 --disable-grabbitmqproxy --disable-vgauth --disable-deploypkg \
 		--with-linuxdir=${STAGING_KERNEL_DIR} --with-kernel-release=${KERNEL_VERSION} --without-root-privileges"
 
-EXTRA_OECONF += "${@bb.utils.contains('DISTRO_FEATURES', 'x11', '', '--without-x', d)}"
+NO_X11_FLAGS = "--without-x --without-gtk2 --without-gtk3"
+X11_DEPENDS = "libxext libxi libxrender libxrandr libxtst gtk+ gdk-pixbuf"
+PACKAGECONFIG[x11] = ",${NO_X11_FLAGS},${X11_DEPENDS}"
 
 EXTRA_OEMAKE = "KERNEL_RELEASE=${KERNEL_VERSION}"
 
-- 
2.11.0


