Return-Path: <mkelly@xevo.com>
Received: from NAM02-CY1-obe.outbound.protection.outlook.com
	(mail-cys01nam02on0089.outbound.protection.outlook.com
	[104.47.37.89])
	by mail.openembedded.org (Postfix) with ESMTP id 2AA5877FF5
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 27 Jun 2017 22:24:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=uievolution.onmicrosoft.com; s=selector1-xevo-com;
	h=From:Date:Subject:Message-ID:Content-Type:MIME-Version;
	bh=DeDd9pcbBzkx8vV1Oth5berZwApQG0stlEyJ//xqHKA=;
	b=Hvs0turO05oxiyCe3Hp/KAAVGy739S6+wBgEoNkgOr7fKYn5S3Ft+rybFodQVATLVx58Lg44hwXh/mHHHB+ipCz2bGQ2DKTLICdRboJxB5XMVCoJwVGek3p+V48K9p1FcHn4WMjahWRscEafPjbrzTbiFXdPr49PXgfbDXl90HA=
Authentication-Results: vmware.com; dkim=none (message not signed)
	header.d=none; vmware.com; dmarc=none action=none header.from=xevo.com; 
Received: from [10.0.1.79] (65.122.179.226) by
	BN6PR0101MB2931.prod.exchangelabs.com (10.174.87.140) with Microsoft
	SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id
	15.1.1199.15; Tue, 27 Jun 2017 22:24:30 +0000
To: openembedded-devel <openembedded-devel@lists.openembedded.org>
References: <cover.1498257745.git.mkelly@xevo.com>
From: Martin Kelly <mkelly@xevo.com>
Message-ID: <98263123-d66c-be92-a5f2-13c7c448f4b2@xevo.com>
Date: Tue, 27 Jun 2017 15:24:24 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:45.0) Gecko/20100101
	Thunderbird/45.8.0
MIME-Version: 1.0
In-Reply-To: <cover.1498257745.git.mkelly@xevo.com>
X-Originating-IP: [65.122.179.226]
X-ClientProxiedBy: BN6PR21CA0017.namprd21.prod.outlook.com (10.173.197.27) To
	BN6PR0101MB2931.prod.exchangelabs.com (10.174.87.140)
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: d48a2d65-3d36-4d56-f5fb-08d4bdab481f
X-Microsoft-Antispam: UriScan:; BCL:0; PCL:0;
	RULEID:(300000500095)(300135000095)(300000501095)(300135300095)(22001)(300000502095)(300135100095)(300000503095)(300135400095)(201703131423075)(201703031133081)(300000504095)(300135200095)(300000505095)(300135600095)(300000506067)(300135500095);
	SRVR:BN6PR0101MB2931; 
X-Microsoft-Exchange-Diagnostics: 1; BN6PR0101MB2931;
	3:nfVei81KcXHZRhWkKLXsGS6VscGUrhYQMBLVOZotqeJaownd9GaoOd2IBTP1vnrgfXLPEGjH5qrb/TziwyxUL/0RA4tM04Y5JfkgnMoG0oil7RmKcQ1kgmcooN3RmVWABP/xyTuldM9PNzgL4Tc5MdUS6T+r2HKk29Nvsh/nVV3J+v0TVuC/FUbrkynZOeL+zhpkpL33vZ6RuudVCTJD7bc7FYOV9Mtw0SB/bfL1WJe+2/UzkI6DgOhBoB4UXyr4i9KOKEqqRW3aPv8DmEd3iCYee/UO9Vsq1oLJUEvwxwecdpNmSAZWKeeIMcZUlBmq0AW3Jb5/Q6UZtXIbI+U0ubq2sB7QMGzl1Q5I3+WYKshIvVjhAruh9vU/Gh93dWBGUuLelGrcrscl0EQKdHAhT4Hzi1+FAqeEbdICuj+9DJkmqoIMf6bWmNh8rObP/dYGaQHxpKe8Opp0jgUaQtoTx7xenq/JiKyM2pNTzUDtMP+LMXDR+OYl+qv0My/48h/aPaCFRSpBJqL7z1Vdq1rB5eqOOTBXZnEJ8YPEi4ZwLI9LYuTXianQMNt4ck86j2a1CL5NXxgk3sTCj9P5U9nQaino/0HYJoteSl5xNj73yyBVPY15tSFIt6Wjrl9Ns/iR+h3/G+hTl7TQDst4oEO9vOrqCZlemzTYsvYgOX/Fno5+Is8gnKU7wRSC3dlPLnVMT29lhq4GnM0ncCqKey1sRxfosx+NDl+DhpRFb2VOgiQ=
X-MS-TrafficTypeDiagnostic: BN6PR0101MB2931:
X-Microsoft-Exchange-Diagnostics: 1; BN6PR0101MB2931;
	25:0NXC00NkkUxOJdUnmUR6osUtc/4MMaaN0nH1jufQpv3K3VS83s8MTDUCCRTwc5raVkdh8IQS5uFsQa7qvvUdq5snwILKyEC1uLbD6m/OQk4AhzfVPlBGqy8xdrQzh7fFImuhQ/PDJpqdtB/vi50MdHA/xD8NaMKG6PTo2h0nsUTO9xYMw/yE2QqKW0htRpsQBGD7f5nN47qKTL8FLz1UihyluZo75Z3jn0TnsQ3rog4NgD9aNIo1pELtM+6i/ig162JY/TlZjxsYU2ZHc2jLZMHNx6aBq0+VhUcRd1cg3zuJKWEPd8D98zu9OzsJTDTDIrBbTh5NUdfeGdoYoUQd2Ni/Gpw58Hq4mFRyguqYIleKMhDU2ZiVUvDTMWe8UZoBalz5SpIQXffwi+7TvgXvElZVLS9+vd/qTCHMEQmG8li5+jG676pFk4g5KvThf3PFt1ClDKoaGsDD61CFjqOn7YL3jD4gmhuXMv8XjXlDm+h/tl66H1JvkJ27OGuMLqDvIbs1vg0EZrUdUSv4zJME35jBAmSpmm3H69keA4ynoREDBdcG0htIDYP+rQcn/wOXtwyaEheMumcisCaviz/xT1kenCP7FUlQpwTwHZ3ibPBzFyVznRy6K7GKG6mlgR3tWKFKZ9PdCEVl0/tgYKV7iJTZyLSynO0grMPwp2BDbDLNazjDN7VXyBWbr6dA02ZHChjbQlphZTDXoknvs8tYQi5UfBtYTwRIINURfFxz9fTb8yg4t/RfZwVsvA26tURiwH5jviTvcJYrYg45RpA9Nff5938dyy/rcQTg0tbHxLTBe56PH1Tg5jeTTQNUMMM4E5yZLezcUq8SOwJq85VcYlsMJh8RlvB0J5T07k0HAeWDHyc/HgrAaBkgZyYtzw9PKHbCTOuYIXj7xSzUjcQHPTPHF3keGW+Le8AnEL8ZGHc=
X-Microsoft-Exchange-Diagnostics: 1; BN6PR0101MB2931;
	31:GqOdNlIl/A4bwQMSqx+NzoLoJe4FxnhPHRpNrpNhLBvTn66iOptnRMnwAQhp6IACxPKgVMQEl1+OOHwApAQg5jL1WFq/cJeiwZELrnE3Hk4rln/Je4E2MJyBbg6PZ3Rltmay15IZ00K3JNhYURiGT+BtWj5XdbCiKRRxupU0m4HJ+KawLoOgK9suT2ek0ycHFylqGtjtV8R7+Pqwf3FdhkeTk0cXPdgzl+JxiWJL6CjpyXIbQWRRW1xYiDmjhcCJOR5izDZhWp9/Ewv3TDWlqJ7V9yTzo2jJ/X3D7Zj7PHxsQe1O/oRCHEC4Pq50TTqBqy48XbNrPv1XK4ogCECO4eo0LZeFjkM4AnUcuwFz9DZOvgwwtvYAM0SjwQ9nxy5Iyrj1tiu19is356RPKXU5lx8xEo4pB+GRmavt6LC09r8TvphzgyFEgAbnUyNyAG94HR48YMb0Andc8vQt6mGrBFtQBKLw8a7lksYOASzH/wqLbqj8hujN1DxRb/psdWtsqUIgJd3v0uP3VOiHp2AENMtZi87Ahcalk8VokF+HsG16U3roqyxf4OhDibZINK3OzBlq54HOSqqKEJJFtLdZcb10d/PbRomM8/H/2wUEEoLLw5sVotCkMsuyaiGkHLznKcguZjU5K+/NZk61RERhUB+FfqCqHU9Qa92H50299QKseQ999YXqn2Dpv2c6EL+S27iwFM4sXegkKz+a8fBUQQ==
X-Microsoft-Exchange-Diagnostics: 1; BN6PR0101MB2931;
	20:azOAZjEI2edHjNfVyIRhEULPeHgKPa27aYhCmWD46dUt8xv/Wze7zf3qItl4gVeRtKCagGRbBCFGSVStA/lHvZCgXzhScJdfEux0zyheIWvvPvG8pg89sK1E/6r3qJWItRMDc8HZVwSPtz8sHoP14jT2KEluPn/HjW7ryXhTIIRvi4rIzH4wEjQ6XI2ZL/az4u+TIaQluN50fcWkeqfBHhVDPWOP5Nk0wfMJyVlPqu3/xEUkbZIpIYWm5ma0gLX6+9ykPgpJEsHsaJsO1XO1WE2lJxlnAAaa7WsvoRT+HboTkWF5M+YQRctFmQ4mugP9ftteGsMyVFiXynewFGuA9B6UDE6CB8gYNFzvddLCoaH8zPbMYWJGvwINVLbcGp1yVueCNWehvmBNf/eS6yjs+XAYNdzIs4NIS8SG/MJg8MY=
X-Microsoft-Antispam-PRVS: <BN6PR0101MB2931E3690EB00B3B03F6CD00ABDC0@BN6PR0101MB2931.prod.exchangelabs.com>
X-Exchange-Antispam-Report-Test: UriScan:(133145235818549)(166708455590820)(236129657087228)(148574349560750)(167848164394848);
X-Exchange-Antispam-Report-CFA-Test: BCL:0; PCL:0;
	RULEID:(100000700101)(100105000095)(100000701101)(100105300095)(100000702101)(100105100095)(6040450)(2401047)(8121501046)(5005006)(3002001)(93006095)(93001095)(10201501046)(100000703101)(100105400095)(6041248)(20161123560025)(20161123555025)(20161123564025)(20161123558100)(201703131423075)(201703061421075)(20161123562025)(6072148)(100000704101)(100105200095)(100000705101)(100105500095);
	SRVR:BN6PR0101MB2931; BCL:0; PCL:0;
	RULEID:(100000800101)(100110000095)(100000801101)(100110300095)(100000802101)(100110100095)(100000803101)(100110400095)(100000804101)(100110200095)(100000805101)(100110500095);
	SRVR:BN6PR0101MB2931; 
X-Microsoft-Exchange-Diagnostics: =?Windows-1252?Q?1; BN6PR0101MB2931;
	4:XuCmPDwWb024tcItQ/Ke89JKtFGyVB22MpBF?=
	=?Windows-1252?Q?P1bxKgo1WwqHvTHote0rQ7/gffYRVtOD/AJEhtcagJFTutQlKXY21/j0?=
	=?Windows-1252?Q?Tu579qEX8y3KeFxa+lI2FHcJwwI9Az/TYrzIGW6+PETChGkGzwepW4Vu?=
	=?Windows-1252?Q?Dt9USuWAZy7iRkYQ01tsXvP9eI/+SH7fagYkRVmpSkt78W+dYoVXlwZ1?=
	=?Windows-1252?Q?aTJ/YEV9w8Qv/FieJ+ozWpTgC8HEWaIbYaKnBU/Mo3pYWvAdui5YT6ZW?=
	=?Windows-1252?Q?kjGq3QI8DCWRHC/aE8HOtr/m69FCaJrxkaqaYPjn2IewhargfkN2q/nR?=
	=?Windows-1252?Q?pA00sJ7gimDy/cdcENTMZVxCgczOo6Na9lJRbi5c1rI44ABSbviYsgC1?=
	=?Windows-1252?Q?es7daCtmVTrhZxPRrRIefiXG2XlqxnNL/YsNNkHRpOhneQKQpoXHoy8g?=
	=?Windows-1252?Q?UxM+JE2emLt111JR7mJX1lb2CT49hFWprxtUFnf/gSky8sfXntXCMYRM?=
	=?Windows-1252?Q?iIH00ShfC2t42ojCgTDlqj74lnUTlOiI0oarbbnJrIR9/YEhCy0GTUQh?=
	=?Windows-1252?Q?oZ5/wzR7c3bbturJAyw87R6mrgkUSZv9TBG5Og3mjak7aZNyDsv1z4/e?=
	=?Windows-1252?Q?8e1MiOjf3H4FvYVraBPiNBFSOXRoADhGza7G7zADc9239zYddsmdykgh?=
	=?Windows-1252?Q?TM7uIja+wxmC1Ms5uSner2FUmkc4Wt+J+4kHwgROxpPMHIoTCFGeKPAx?=
	=?Windows-1252?Q?1Uhw3m3hHrDKHaedKWTKeFDX8ennTzpS/bbmLORHRyXbnITixmQP9X2H?=
	=?Windows-1252?Q?AChGw/RKExvwkoIhow2bZ2CAiLjMjOr+P0wdX+g+S+1gyuLgyXGUfMWJ?=
	=?Windows-1252?Q?IgjV0eJ4TKPEoXz6NeVaYt0uknBMtEcn55+/hJ9u0zLgogC86xj7mwi2?=
	=?Windows-1252?Q?hrZ5jA3gwTH5u4WUeuSXjaAxik+0A9WrFXHyDzXcTXuLO5x+vDYw5Fqt?=
	=?Windows-1252?Q?iuUXWrB2nBO+WfYkWipkBFlscQdt7vNFA5V2ivjVR3Z+CRD6bt655vxU?=
	=?Windows-1252?Q?mTQ/i8/Ky6cIXDAFCFy+PhVG1Cuj0VQUno5iqf07qLTf6eQy0PpOfFOd?=
	=?Windows-1252?Q?+lXKE5JZhJffTF8pCPvi01aVtCMbbrsseX1enSCMLo6y//6n5P7oAlN4?=
	=?Windows-1252?Q?psNPNeEopuo/6QMRNMd/X28/JgK/D4rDdcGPtsNd64Z1c8D1HAxV7giU?=
	=?Windows-1252?Q?nxj5Bl/4X96Y2UZ0g3+TlZSDWBEf/Np0PY4CeeCL519Y5YF/k2KbNTXn?=
	=?Windows-1252?Q?lQLQjnNIGw0rXz6zkyei2PAs8MZjiWrTsBNo5kJGkLM5CDo=3D?=
X-Forefront-PRVS: 0351D213B3
X-Forefront-Antispam-Report: SFV:NSPM;
	SFS:(10009020)(4630300001)(6049001)(39450400003)(39400400002)(377454003)(53754006)(377424004)(24454002)(53936002)(77096006)(53546010)(38730400002)(6486002)(110136004)(229853002)(7736002)(90366009)(4326008)(86362001)(230700001)(6306002)(305945005)(54906002)(76176999)(31696002)(6916009)(65826007)(2950100002)(6246003)(50986999)(54356999)(47776003)(25786009)(36756003)(3846002)(42186005)(65806001)(508600001)(66066001)(8676002)(189998001)(23746002)(33646002)(966005)(230783001)(4001350100001)(6116002)(6666003)(64126003)(83506001)(81166006)(2906002)(5660300001);
	DIR:OUT; SFP:1101; SCL:1; SRVR:BN6PR0101MB2931; H:[10.0.1.79];
	FPR:; SPF:None; MLV:sfv; LANG:en; 
X-Microsoft-Exchange-Diagnostics: =?Windows-1252?Q?1; BN6PR0101MB2931;
	23:nkOT9hCAZ9QEUCpc++ytEpdwycdkQoV8gtj?=
	=?Windows-1252?Q?JVv6aoOcevzCAUz6M2zwNhYQNnNWjwe4t/eFEYjtZpJ1vHT1MvzJQi8R?=
	=?Windows-1252?Q?1xql+9IubdDlReex24Q7MXy4EyNu15Ueuz3z7qsgMzOlHKzlpnWmxRST?=
	=?Windows-1252?Q?9mVNypXrze7YPv9l5a1XKvaxsC7rnKg0ns3/jS34JKsTOUxnj6a9yFAU?=
	=?Windows-1252?Q?/5iD0Al/Sa4L7H058Rb1TYf8FmwJ5Z+Cshv/pBCozrh+KpygVW808VEC?=
	=?Windows-1252?Q?iKmJZT1toRb+nrgc1WpTCanpUS9OFU+aAsnj5BVVHv36jUTBFy2/JtNj?=
	=?Windows-1252?Q?7vmmemp3SNC6BnN2lzhUvHaz+srDIM1ROexMlRZ6YXooMgzlivVaeJT5?=
	=?Windows-1252?Q?K96KxkSGDN9uCwFQTzjizO9LfuTya4UqOtCpvAK3bg2lRx6dIrr1lUZC?=
	=?Windows-1252?Q?dOxLj2KetZ+6yZB+k9xgevS+GGiQ/AQEaFoGFTzfGc7Qixxpymb5fLIc?=
	=?Windows-1252?Q?K+Vwprgue/ki38rwuQsKleRwqZ/S50EAp6Aehd7RDzT1sY3QSim5u5AC?=
	=?Windows-1252?Q?W0LVZV/oOnSsLNLPiklH9r4iVGqxjwrZ2aeRAQw8Pno+0jXP+9WD7FWt?=
	=?Windows-1252?Q?W0nahVEZUKMdjNN9N1ww/Vc9BZ1zkktGgMKKLssOk4Da/8LZ1J+nChAU?=
	=?Windows-1252?Q?0NRQOM8ZMSlV3ucR8b3R24N6URrCO4/szXE9FfYwLCtKmgjjQ7fEMayH?=
	=?Windows-1252?Q?KuyeNpb7vEmUW9XsMIPp0UjcAGiyDvriDZLDHPKoN1iFOaFviNnn9cxp?=
	=?Windows-1252?Q?iHgJmcGM/l9JtfaggBA9sT+3rb3vdUzzF9SW/FSnwCMEMcYbY7XSMaGU?=
	=?Windows-1252?Q?KKpjAqGSIWMR49DZVRRHZanZiajBfuE5U88xXJjPFtFyBqhRPqq15Cy1?=
	=?Windows-1252?Q?DD6yPtcbLoHZmb9NPI7gm7Hp+QQBbzizn8hD/ciQfaD9vPltJe0goKlS?=
	=?Windows-1252?Q?7O5F7AC/7tXAj4Nsy27xp/dKAyXFkbYPSC5vKuYhTchL0PfJm8okGAOF?=
	=?Windows-1252?Q?9d2aKMWdfvweeGi7YYQivehX1JdEIVZm1yyFaVEp58O1SQRbGBET1b88?=
	=?Windows-1252?Q?1Yky8ZaGdjT67s2AHq5uxfHTW/nPlQplTw0M5Nt4xCS9tmoOiFabKP+T?=
	=?Windows-1252?Q?2CZX2rD2JCFGx+x8tZ5/eARUFKqPc+7qev96UNHkGUZ7AjP9+mqsxmRW?=
	=?Windows-1252?Q?HnZnpnceemSgTAV0Dr9doVP+Z2rHJJDacGE2S1WtHNcS5HukpRWR5Mp6?=
	=?Windows-1252?Q?y4nhSnwVv8ke5Xh9BiF1scgULFwIJVCdLvn8ia2fYMK5tYHSTK0zugWg?=
	=?Windows-1252?Q?fTSsKRI4oyUs2o9xBZ9H69jl46YSQ4UceHA=3D=3D?=
X-Microsoft-Exchange-Diagnostics: =?Windows-1252?Q?1; BN6PR0101MB2931;
	6:w2o5IxLVegEw4x7+qWWirpRsuligFTB51FJ9?=
	=?Windows-1252?Q?ldUSum0Xr3yMry3+uoRzKcLhkpORHxH3aRLD/XeXDxTbQ0OHIQXUScn2?=
	=?Windows-1252?Q?lrHoVfuHoLwpJ6l4M3D98Nxs77Zg/sG6rDwlrFH5qldlpkwNOGzc7yDJ?=
	=?Windows-1252?Q?ajqfSFybW6xffLoK66wYFecJRi/kQVJcdisH6MlPVu92C9g0/np98C3X?=
	=?Windows-1252?Q?6D2uoN+YbmjtyLLtUWC7qVlM49gbYu/bx+rfYN48mnReYQQSay3tiHwS?=
	=?Windows-1252?Q?lzRTQLpIxtfdQCpUTh0enZWsBhTS9fo+bwa2d0U6m9xhQ0vOw1IxiOJO?=
	=?Windows-1252?Q?7B51QeoBSmN/RIF7HWKynuHcNue7tI4iYCXzhccja7vvina8KFvZqp2a?=
	=?Windows-1252?Q?QRB1eacRVGwCyIrsPXtHzvqj/MoHP6IhhzxcUycAlBIbgK+wb2Zh0G8e?=
	=?Windows-1252?Q?YtLy3huRKf9GyZmUAGucVCNTQ+8ZjtANywRTIQP+d0rXT8atzWiGJd0+?=
	=?Windows-1252?Q?8A3StXOVuIXNz491MxJDbmonMBLVDU2S4SRY8eCkPgvRg0GbD3SbTXe3?=
	=?Windows-1252?Q?ESNZAPa7HIRiOPDUan9Ef7ULPzI3Yyr80xaTbfAVp4Xbqad1pHYAnbOm?=
	=?Windows-1252?Q?gk/hRhaw4ICQSx644XTJo2XiYv9WVAs3zGkciCGRB0sNKyd00ptX7InG?=
	=?Windows-1252?Q?u7JnE3NhI2yW9OVH6eYIrsr15IT6UTgcM402Kbb0uSMBhOGnhhc9jSkk?=
	=?Windows-1252?Q?s+nxRwLrYqpp3s0qP9Wkf105cRcGFlsOY+HIrdoxrR4kml1cTrmekZZR?=
	=?Windows-1252?Q?oBY74F9t9aK+GuE+mfqK23R27RRZAAMREBWeWw6yyCTM6p2dkRS2OO3K?=
	=?Windows-1252?Q?L3ugBHPnibOjnorrmmCLIlUjl/Sn4WmzK7+qo4uSh1rZrc1pz2MBTCQF?=
	=?Windows-1252?Q?zQYV4BBuL4PYM/QHXdAZa1jm6BgxdNVrgMmgJ2QAVOQbD4rRUB9o7hCS?=
	=?Windows-1252?Q?1nurQhs7ds3MSiXsdrEr0fMUjcy+K6I1wb6PYtNa3c2/u48YiHWHXS9P?=
	=?Windows-1252?Q?Qhyg2BOdpmYO4Cg=3D?=
X-Microsoft-Exchange-Diagnostics: 1; BN6PR0101MB2931;
	5:IWuGPjxZmeR7qcQME7exVE06PmzKR7Xx6ZUMN6h7qqf8be3k2W/aSttmFEVgjmPhDnMsZ+rCs/ccI1p3FuMj+/nlKN6hLldyXvCwr1bbboAaAYQ5vu/jwnY1xUxiF4UQn4Snj5pT8pOByyWDnxxmGbhz6fuwZ4mfISAbG3UyZSJGZNeD1MQ40yHQa5wGh2Ub2LIsBau/Oq1haEG043waRWe7sNUum+BBtd8dg68Am4vqI0WCJjXBOItKmvkUwFd1ik5toVosEJl4yBayBqihf8yGlcWuhL3ZpRB2graWL6EmlJC6HI1MXO+qrFZGBxkbNTq+rY7Bhlrp3iClccH4wsvgDxlIkEEZ2K/ar8UruKkR4akm3N4P93k+g/mK4yDeck4uiCmAaOVtE93MoBJReySRQdMFPZ6EAebyEc+m8FbCz9QsIEexIUAnjXeg97ZHE1u5ndsa+c8XSBXzfI5hE1Bp8QkFO/zfQqkCEop58mk7JhL6wkVq34n2TS3ZBJQE;
	24:yI7lK0VpB8eLs0lmtAPLEzPagtEoweF7bi/oZuKP+QtNUOHF+PtE4RA47LShxLMPK/x0Fe72f9KArbZEa4vnb9WaMyhhKCG7pUl935OmkQM=
SpamDiagnosticOutput: 1:99
SpamDiagnosticMetadata: NSPM
X-Microsoft-Exchange-Diagnostics: 1; BN6PR0101MB2931;
	7:MxKU8RZdH/dfFxsaBGJ2dKNwL976wDyrjjg9jAkTda5XMkQJN+6DgsoOsZy/xb+m3NP+SIYOaS7FT9x0pAaMdzlhs4k7bQN83VLN8rG5irHSPT8rAmEuLvQ928GZTfn5SBwmu3J00S3/BlNwB4sRoI/Y3RX6jyGzF55A0ChcG+wi351HB+kNz4M+JhCaKQba6Sw0AxRegGrT4eFc/Phs70tZ0bvzatqGrZCCPcMlYNkP4GNhcA0lCONtEUe7AsdJOJI7g45WPwkr7IJN+yWP+ChrGX1nfmdFnpCr/A/ECWaCfbB2jPMgAeQT/g6M+9Kgn9JIcwkIEvHO6u7rtp4Zz0igrMPJZPMV90oR7vY0pTD19VlVkgM29sBSqZVtAedCh/vNktWF/TvEC9++wUsyH5Q1yMcO6wnwYb0a9X79Mn8g8p53s/DFPRrKFx74pH/bDS0osSPjhsfZFVAFX0M29QI7D7lpe7L2zZaCiCrfuD0dA2sPzos0l/ATfer2iT7u/kMKZrw4TuuQZZH/INHOQ3sivBhcB2U8mwfyyl1xxSfJ2C3nKQxuHQ+ZGpQDNZnTZ6VEmSMmUWKN/2RAXX/mOQ/fPy0RluwxUCufWHIVIOEmgmunLRyA26QVWxlV8EuFFIkxC5jvap1kXHgKji/OvCVYGMoIvqvn7W+yMy2ZQQ26PTfpkmNm6jbseSWcLi5lIYeLdgroR2rQt/3bcAhOSB86r1MewiDBpMypxgkFK9Hu4aWgSOx0eKsTMOkqsyonYOEdEOKU+eS1ilarMO6L+wwbdzh0N8qQnqqLvPTf2T4=
X-OriginatorOrg: xevo.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Jun 2017 22:24:30.9287 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN6PR0101MB2931
Cc: Darren Hart <dvhart@vmware.com>
Subject: Re: [meta-oe][PATCH v2] 00/17] new recipe v2: open-vm-tools recipe
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
X-List-Received-Date: Tue, 27 Jun 2017 22:24:33 -0000
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: 7bit

(ping)

I mistyped a character, so the patches did not correctly show up on 
Patchwork (sorry!).

On 06/23/2017 03:47 PM, Martin Kelly wrote:
> Hi all,
>
> This is version 2 of a patch series to add a new recipe for Open VM Tools to
> meta-oe. This recipe is invaluable for using Openembedded with VMWare, as
> without the tools, performance is very slow.
>
> More information about Open VM Tools can be found here:
>
> https://github.com/vmware/open-vm-tools
>
> Please note that, as mentioned in the first commit, this recipe is modified
> from the recipe originally found in the Open-Switch repository. The first
> patch is directly from that repository, and the following patches are
> modifications to it.
>
> Original recipe: https://github.com/open-switch/ops-build
> yocto/openswitch/meta-foss-openswitch/recipes-extended/open-vm-tools/open-vm-tools_10.0.5.bb
> Commit 9008de2d8e100f3f868c66765742bca9fa98f3f9
>
> Although the original recipe packaging was Apache-licensed, I received
> permission from the author (Diego Dompe) to relicense it under the MIT license
> for inclusion in meta-openembedded:
>
> https://lists.openswitch.net/pipermail/ops-dev/2017-April/014715.html
> https://lists.openswitch.net/pipermail/ops-dev/2017-April/014716.html
>
> The following changes since commit d2da8b82cfb2f8e55236751c1c56c9e7f3b5f68d:
>
>   scsirastools: Upgrade to 1.6.6 (2017-06-22 16:04:14 +0200)
>
> are available in the git repository at:
>
>   git://github.com/XevoInc/meta-openembedded open-vm-tools-v2
>   https://github.com/XevoInc/meta-openembedded/tree/open-vm-tools-v2
>
> Martin Kelly (17):
>   add open-vm-tools recipe
>   open-vm-tools: add missing pkgconfig dependency
>   open-vm-tools: add missing glib-2.0-native dependency
>   open-vm-tools: clarify and expand licensing
>   open-vm-tools: base_contains --> bb.utils.contains
>   open-vm-tools: update version to 10.1.5
>   open-vm-tools: don't use mspack
>   open-vm-tools: don't use dnet-config
>   open-vm-tools: add #include to fix build break
>   open-vm-tools: add missing X11 dependencies
>   open-vm-tools: remove kernel module logic
>   open-vm-tools: line up configure options
>   open-vm-tools: support FUSE
>   open-vm-tools: scope build to only x86
>   open-vm-tools: style changes
>   open-vm-tools: fix all hardcoded paths
>   open-vm-tools: remove -Wno-error
>
>  .../recipes-support/open-vm-tools/files/tools.conf |  2 +
>  .../open-vm-tools/files/vmtoolsd.service           | 11 +++
>  .../0001-configure.ac-don-t-use-dnet-config.patch  | 41 +++++++++++
>  .../0002-add-include-sys-sysmacros.h.patch         | 33 +++++++++
>  .../open-vm-tools/open-vm-tools_10.1.5.bb          | 84 ++++++++++++++++++++++
>  5 files changed, 171 insertions(+)
>  create mode 100644 meta-oe/recipes-support/open-vm-tools/files/tools.conf
>  create mode 100644 meta-oe/recipes-support/open-vm-tools/files/vmtoolsd.service
>  create mode 100644 meta-oe/recipes-support/open-vm-tools/open-vm-tools/0001-configure.ac-don-t-use-dnet-config.patch
>  create mode 100644 meta-oe/recipes-support/open-vm-tools/open-vm-tools/0002-add-include-sys-sysmacros.h.patch
>  create mode 100644 meta-oe/recipes-support/open-vm-tools/open-vm-tools_10.1.5.bb
>

